library OpioidCDS_STU3_REC_10 version '0.1.0'

using FHIR version '3.0.0'

include OMTKLogic version '0.1.0' called OMTKLogic

/*
**
** Recommendation #10
**
*/

codesystem "SNOMED": 'http://snomed.info/sct'

valueset "Illicit Drug Screening": 'illicit-drug-urine-screening'
valueset "Opioid Drug Screening": 'opioid-urine-screening'

code "Positive": '10828004' from "SNOMED"
code "Chronic Pain": '82423001' from "SNOMED" display 'Chronic pain'

parameter Orders List<MedicationRequest>
parameter Screenings List<Observation>

context Patient

// the medication being prescribed
define "Context Prescription":
  First(Orders)

// TODO - make this more robust - maybe put all chronic pain codes in a valueset?
define "Is Medication Prescribed for Chronic Pain?":
  exists (
    "Context Prescription" Rx
      where Rx.reasonCode is not null
      and CodingToCode(Rx.reasonCode.coding) ~ "Chronic Pain"
  )

// Most recent drug screening in past year
define "Illicit Drug Screening in Past 12 Months":
  First(
    Screenings IllicitDrugScreening
      where ToConcept(IllicitDrugScreening.code) in "Illicit Drug Screening"
      and IllicitDrugScreening.effective.value same day or after Today() - 1 year
        sort by effective.value
  )

// Most recent opioid screening in past year
define "Opioid Drug Screening in Past 12 Months":
  First(
    Screenings OpioidDrugScreening
      where ToConcept(OpioidDrugScreening.code) in "Opioid Drug Screening"
      and OpioidDrugScreening.effective.value same day or after Today() - 1 year
        sort by effective.value
  )

define "Drug Screenings":
  "Illicit Drug Screening in Past 12 Months" union "Opioid Drug Screening in Past 12 Months"

// If true, suggest urine screening test - STOP
define "No Screenings in Past Year":
  not exists (
    "Drug Screenings"
  )

// TODO - Account for component Observations
// If true, determine if the screening is consistent, which consists of the following:
//     - Opioids are found: check if the opioid is prescribed
//     - Illicit drugs are found: warn the user
define "Has Positive Screening?":
  exists (
    "Drug Screenings" Screenings
      where
        Screenings.interpretation is not null
        and Screenings.interpretation.coding[0].code.value = 'POS'
  )

define "Has Illicit Drugs in Screening?":
  exists ("Illicit Drug Screening in Past 12 Months")

// Assuming only one code
define "Inconsistent Illicit Drugs":
  'Found the following illicit drug(s) in urine drug screen: '
      + GetIllicitDrug("Illicit Drug Screening in Past 12 Months".code.coding[0].code.value)

define "Has Opioids in Screening?":
  exists ("Opioid Drug Screening in Past 12 Months")

define "Prescribed Opioids":
  Orders O
    return
      Lower(OMTKLogic.GetIngredients(CodingToCode(O.medication.coding)).ingredientName)

define "Unprescribed Opioids":
  "Opioid Drug Screening in Past 12 Months" OpioidScreening
    with "Prescribed Opioids" Prescriptions
      such that
        not (Lower(GetOpioid(OpioidScreening.code.coding[0].code.value)) in Prescriptions)
        return GetOpioid(OpioidScreening.code.coding[0].code.value)

define "Has Unprescribed Opioids?":
  exists ("Unprescribed Opioids")

define "Inconsistent Unprescribed Opioids":
  'Found the following unprescribed opioid(s): ' + "Unprescribed Opioids"

define "Missing Opioids":
  if "Opioid Drug Screening in Past 12 Months" is not null
  then
    "Prescribed Opioids" Prescriptions
      except
        Lower(GetOpioid("Opioid Drug Screening in Past 12 Months".code.coding[0].code.value))
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

define function CodingToCode(coding FHIR.Coding):
  System.Code {
    code: coding.code.value,
    system: coding.system.value,
    version: coding.version.value,
    display: coding.display.value
  }

define function ToConcept(concept FHIR.CodeableConcept):
  System.Concept {
    codes: concept.coding C return CodingToCode(C),
    display: concept.text.value
  }