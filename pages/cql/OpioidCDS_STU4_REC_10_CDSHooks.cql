library OpioidCDS_STU3_REC_10_CDSHooks version '0.1.0'

using FHIR version '3.0.0'

include OpioidCDS_STU3_Common version '0.1.0' called Common

/*
**
** Recommendation #10
**
*/

/*
  Trigger context:
    Primary care/ambulatory care
  Trigger event:
    Prescription of opioid with ambulatory care abuse potential
  Assumptions:
    Count only ambulatory prescriptions
  Inclusion criteria:
    Opioid Rx for at least 80 of the past 90 days
      AND
        (No Urine Screening in last 12 months
          OR Expected opioids not present
          OR Unexpected drugs present)
  Exclusion criteria (optional):
    Meds indicating end of life
    Conditions indicating end of life
  Notification:
    No Urine Screening in last 12 months - Patients on opioid therapy should have a urine drug test performed every 12 months.
    Expected opioids not present - Expected opioid x not present in urine screening
    Unexpected drugs present - Unexpected drug x present in urine screening
    Ref: CDC Recommendation #10.
  EHR expectations:
    Have availability to snooze for 3 months
*/

parameter ContextPrescription MedicationRequest // Current prescription
// Orders includes the ContextPrescription
parameter Orders List<MedicationRequest> // {base}MedicationOrder?patient={{Patient.id}}&status=active
parameter ObservationsInPastYear List<Observation> // {base}Observation?patient={{Patient.id}}&date=gt{Today() - 1 year}

context Patient

define "Validate Trigger Event":
  exists (
    ContextPrescription triggerScript
      where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(triggerScript.medication.coding[0]))
  )

define "Inclusion Criteria":
  "Validate Trigger Event"
      and not "Exclusion Criteria"
      and AnyTrue(Common.ProbableDaysInRange(Orders, 90, 80))
      and
        ("No Urine Screening In Last 12 Months"
          or "Has Missing Opioids?"
          or "Has Unprescribed Opioids?"
          or "Has Illicit Drugs in Screening?")

define "Exclusion Criteria":
  exists (
    Orders orders
      where Common.IsEndOfLifeOpioid(Common.ToCode(orders.medication.coding[0]))
  )
  or Common.HasMetastaticCancer

define "Most Recent Illicit Drug Urine Screenings in Last 12 Months":
  Last(
    ObservationsInPastYear observations
      where Common.IsIllicitDrugScreen(Common.ToCode(observations.code.coding[0]))
        // TODO - assuming a max of 1 component until bug fix (see TODO below)
        or
          (if observations.component[0] is not null
            then Common.IsIllicitDrugScreen(Common.ToCode(observations.component[0].code.coding[0]))
          else false)
        // or exists(CheckObservationComponentCodes(observations.component))
        sort by effective.value
  )

define "Most Recent Opioid Drug Urine Screenings in Last 12 Months":
  Last(
    ObservationsInPastYear observations
      where Common.IsOpioidDrugScreen(Common.ToCode(observations.code.coding[0]))
        // TODO - assuming a max of 1 component until bug fix (see TODO below)
        or
          (if observations.component[0] is not null
            then Common.IsOpioidDrugScreen(Common.ToCode(observations.component[0].code.coding[0]))
          else false)
        // or exists(CheckObservationComponentCodes(observations.component))
        sort by effective.value
  )

// TODO - this is a translator bug: https://github.com/cqframework/clinical_quality_language/issues/266
/*
define function CheckObservationComponentCodes(Component List<FHIR.Observation.Component>):
  Component component
    where Common.IsOpioidDrugScreen(Common.ToCode(component.code.coding[0]))
*/

define "No Urine Screening In Last 12 Months":
  "Most Recent Illicit Drug Urine Screenings in Last 12 Months" is null
    and "Most Recent Opioid Drug Urine Screenings in Last 12 Months" is null

define "Positive Illicit Drug Screening":
  "Most Recent Illicit Drug Urine Screenings in Last 12 Months" mostRecentScreening
    where mostRecentScreening.interpretation.coding[0].code.value = 'POS'
      or
        (if mostRecentScreening.component[0] is not null
          then mostRecentScreening.component[0].interpretation.coding[0].code.value = 'POS'
        else false)

define "Has Illicit Drugs in Screening?":
  exists ("Positive Illicit Drug Screening")

// Assuming only one code
define "Inconsistent Illicit Drugs":
  'Found the following illicit drug(s) in urine drug screen: ' +
    (
      if GetIllicitDrug("Positive Illicit Drug Screening".code.coding[0].code.value) is null
        then GetIllicitDrug("Positive Illicit Drug Screening".interpretation.coding[0].code.value)
      else GetIllicitDrug("Positive Illicit Drug Screening".code.coding[0].code.value)
    )

define "Positive Opioid Drug Screening":
  "Most Recent Opioid Drug Urine Screenings in Last 12 Months" mostRecentScreening
    where mostRecentScreening.interpretation.coding[0].code.value = 'POS'
      or
        (if mostRecentScreening.component[0] is not null
          then mostRecentScreening.component[0].interpretation.coding[0].code.value = 'POS'
        else false)

define "Has Opioids in Screening?":
  exists ("Positive Opioid Drug Screening")

define "Orders Before Most Recent Opioid Screening":
  Orders orders
      with "Positive Opioid Drug Screening" mostRecentScreening
        such that orders.authoredOn.value < mostRecentScreening.effective.value
      return
        orders

define "Prescribed Opioids":
  "Orders Before Most Recent Opioid Screening" orders
    return
      Lower(Common.GetIngredient(Common.ToCode(orders.medication.coding[0])))

define "Get Opioids From Most Recent Screening":
  "Positive Opioid Drug Screening" mostRecentScreening
    return
      Lower(GetOpioid(mostRecentScreening.code.coding[0].code.value))
        union (
          if mostRecentScreening.component[0] is not null
            then Lower(GetOpioid(mostRecentScreening.component[0].code.coding[0].code.value))
          else {}
        )

define "Unprescribed Opioids":
  "Get Opioids From Most Recent Screening" mostRecentScreeningOpioids
    with "Prescribed Opioids" ingredients
      such that
        not (mostRecentScreeningOpioids in ingredients)
    return mostRecentScreeningOpioids

define "Has Unprescribed Opioids?":
  exists ("Unprescribed Opioids")

define "Inconsistent Unprescribed Opioids":
  'Found the following unprescribed opioid(s): ' + "Unprescribed Opioids"

define "Missing Opioids":
  if "Positive Opioid Drug Screening" is not null
  then
    "Prescribed Opioids" Prescriptions
      except
        Lower(GetOpioid("Positive Opioid Drug Screening".code.coding[0].code.value))
  else null

define "Has Missing Opioids?":
  exists ("Missing Opioids")

define "Inconsistent Missing Opioids":
  'The following opioids are missing from the screening: ' + "Missing Opioids"

define "Get Indicator":
  'warning'

// Functions
define function GetIllicitDrug(value String):
  case value
    when '3397-7' then 'Cocaine'
    when '14267-9' then 'Methylenedioxymethamphetamine (MDMA)'
    when '29868-7' then 'Gamma Hydroxybutyric Acid (GHB)'
    when '12327-3' then 'Ketamine'
    when '3732-5' then 'Lysergic Acid Diethylamide (LSD)'
    when '3779-6' then 'Methamphetamine'
    when '17504-2' then 'Psilocybin'
    when '41020-9' then 'Flunitrazepam (Rohypnol)'
    when '3426-4' then 'Tetrahydrocannabinol (THC)'
    else 'Unknown code: ' + value
  end

define function GetOpioid(value String):
  case value
    when '3299-5' then 'Acetaminophen'
    when '14184-6' then 'Atropine'
    when '16485-5' then 'Bromodiphenhydramine'
    when '3408-2' then 'Brompheniramine'
    when '3414-0' then 'Buprenorphine'
    when '3421-5' then 'Butalbital'
    when '12333-1' then 'Butorphanol'
    when '3423-1' then 'Caffeine'
    when '21142-5' then 'Carisoprodol'
    when '16605-8' then 'Chlorcyclizine'
    when '3467-8' then 'Chlorpheniramine'
    when '3507-1' then 'Codeine'
    when '14066-5' then 'Dihydrocodeine'
    when '3571-7' then 'Diphenhydramine'
    when '11235-9' then 'Fentanyl'
    when '12308-3' then 'Hydrocodone'
    when '9834-3' then 'Hydromorphone'
    when '14071' then 'Ibuprofen'
    when '3711-9' then 'Levorphanol'
    when '3746-5' then 'Meperidine'
    when '3773-9' then 'Methadone'
    when '3830-7' then 'Morphine'
    when '42618-9' then 'Naloxone'
    when '12309-1' then 'Naltrexone'
    when '10998-3' then 'Oxycodone'
    when '11247-4' then 'Oxymorphone'
    when '3917-2' then 'Pentazocine'
    when '3962-8' then 'Phenylephrine'
    when '3965-1' then 'Phenylpropanolamine'
    when '11000-7' then 'Promethazine'
    when '4003-0' then 'Pseudoephedrine'
    when '4009-7' then 'Pyrilamine'
    when '65807-0' then 'Tapentadol'
    when '43219-5' then 'Tramadol'
    else 'Unknown code: ' + value
  end