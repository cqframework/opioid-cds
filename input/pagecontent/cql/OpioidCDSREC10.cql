library OpioidCDSREC10 version '1.2.3'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDSCommon version '1.2.3' called Common
include OpioidCDSRoutines version '1.2.3' called Routines
include OpioidCDSCommonConfig version '1.2.3' called Config

/*
**  Recommendation #10
**    When prescribing opioids for chronic pain, providers should use urine drug
**    testing before starting opioid therapy and consider urine drug testing at
**    least annually to assess for prescribed medications as well as other controlled
**    prescription drugs and illicit drugs (recommendation category: B, evidence type: 4)
**
**  When
**    Provider is prescribing an opioid analgesic with ambulatory misuse potential in the outpatient setting
**    Prescription is for treating chronic pain.
**    Opioid review is useful for this patient:
**      Patient is 18 or over
**      Patient does not have findings indicating limited life expectancy
**      Patient does not have orders for therapies indicating end of life care
**      Patient is not undergoing active cancer treatment:
**        Patient has had at least 2 encounters within the past year with any diagnosis of cancer
**    Urine drug screening has not been performed in last 12 months
**  Then
**    Recommend urine drug screening
**      Will perform urine screening
**      Not for chronic pain management, snooze 3 months
**      N/A - see comment, snooze 3 months
**
*/

// META: Plan Definition: http://fhir.org/guides/cdc/opioid-cds/PlanDefinition/opioid-cds-10

parameter ContextPrescriptions List<MedicationRequest>

context Patient

define "Lookback Year":
  Interval[Today() - 12 months - 1 days, Today() - 1 day]

define "Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions":
  (Common."Is Opioid Analgesic with Ambulatory Misuse Potential?"(ContextPrescriptions)) AmbulatoryOpioidPrescription
    where Routines."Is Chronic Pain Prescription?"(AmbulatoryOpioidPrescription)

define "Patient Is Being Prescribed Opioid Analgesic with Ambulatory Misuse Potential":
  exists ("Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions")

define "Is Perform Drug Screen Recommendation Applicable?":
  "Inclusion Criteria"
    and not "Exclusion Criteria"

define "Patient Age Less Than 18":
  if (Config."Age Less than 18 Years Is Enabled") then
    AgeInYearsAt(Today()) < 18
  else
    false

define "Inclusion Criteria":
  "Patient Is Being Prescribed Opioid Analgesic with Ambulatory Misuse Potential"
    and not "Patient Age Less Than 18"
    and Routines."Is Opioid Review Useful?"
    and (not "Patient had Urine Screening in Last 12 Months")

define "Exclusion Criteria":
  "End of Life Assessment"

define "Patient had Urine Screening in Last 12 Months":
   (exists"Non-opioid Screenings" or exists "Cocaine Screenings" or exists "PCP Screenings") and
    exists "Opiate Screenings"

define "Laboratory Observations":
    [Observation: "category" in Common."Observation Category Laboratory"]

define "Non-opioid Screenings":
  GetRelevantScreenings("Laboratory Observations" LabObservations
      where (LabObservations.code in Common."Non-opioid drug urine screening")
  )

define "Opiate Screenings":
  GetRelevantScreenings("Laboratory Observations" LabObservations
      where (LabObservations.code in Common."Opioid drug urine screening")
  )

define "Cocaine Screenings":
  GetRelevantScreenings("Laboratory Observations" LabObservations
      where (LabObservations.code in Common."Cocaine Urine Tests")
  )

define "PCP Screenings":
  GetRelevantScreenings("Laboratory Observations" LabObservations
      where (LabObservations.code in Common."PCP Urine Tests")
  )

define function GetRelevantScreenings(obsList List<Observation>):
  obsList LabObservations
     where date from LabObservations.effective in day of "Lookback Year"
       and not (LabObservations.status.value in { 'unknown', 'entered-in-error', 'cancelled' })

// Returns a text representation of a dateTime using the CQL `ToString` function.
// @param d - a FHIR dateTime to get text for
// @returns {System.String} the text representation of the dateTime
define function DateTimeText(d FHIR.dateTime):
  ToString(d.value)

define "Positive Opiate Screenings":
  "Opiate Screenings" Opiate where
    StartsWith(Lower(Opiate.value as FHIR.string), 'pos')

define "Negative Opiate Screenings":
  "Opiate Screenings" Opiate where
    StartsWith(Lower(Opiate.value as FHIR.string), 'neg')

define "Positive PCP Screenings":
  "PCP Screenings" PCP where
    StartsWith(Lower(PCP.value as FHIR.string), 'pos')

define "Negative PCP Screenings":
  "PCP Screenings" PCP where
    StartsWith(Lower(PCP.value as FHIR.string), 'neg')

define "Positive Cocaine Screenings":
  "Cocaine Screenings" Cocaine where
    StartsWith(Lower(Cocaine.value as FHIR.string), 'pos')

define "Negative Cocaine Screenings":
  "Cocaine Screenings" Cocaine where
    StartsWith(Lower(Cocaine.value as FHIR.string), 'neg')

/*
  borrowed from CDS4CPM CDS_Connect_Commons_for_FHIRv400
  Shoudl this go into OpioidCDSCommon?
*/
define function MostRecent(ObsList List<Observation>):
  Last(ObsList O sort by Coalesce(
    (effective as FHIR.dateTime).value,
    (effective as FHIR.Period)."end".value,
    (effective as FHIR.Period)."start".value,
    issued.value)
  )

define "Negative PCP Screenings Count Since Last Positive Screening":
  Count(
    "Negative PCP Screenings" N where
      DateTimeText(N.effective) >  DateTimeText("MostRecent"("Positive PCP Screenings").effective)
  )

define "Negative Opiate Screenings Count Since Last Positive Screening":
  Count(
    "Negative Opiate Screenings" N where
      DateTimeText(N.effective) >  DateTimeText("MostRecent"("Positive Opiate Screenings").effective)
  )

define "Negative Cocaine Screenings Count Since Last Positive Screening":
  Count(
    "Negative Cocaine Screenings" N where
      DateTimeText(N.effective) >  DateTimeText("MostRecent"("Positive Cocaine Screenings").effective)
  )

define "Positive Opiate Dates in Lookback Period":
  "Positive Opiate Screenings" Opiate
    return
      DateTimeText(Opiate.effective)

define "Positive Cocaine Dates in Lookback Period":
  "Positive Cocaine Screenings" CS
    return
      DateTimeText(CS.effective)

define "Positive PCP Dates in Lookback Period":
  "Positive PCP Screenings" PS
    return
      DateTimeText(PS.effective)

define "Has Positive Screening for Cocaine in Last 12 Months":
  exists "Cocaine Screenings" CS where
     StartsWith(Lower(CS.value as FHIR.string), 'pos')

define "Has Positive Screening for PCP in Last 12 Months":
  exists "PCP Screenings" PCP where
    StartsWith(Lower(PCP.value as FHIR.string), 'pos')

define "Has Positive Screening for Opiates in Last 12 Months":
  exists "Opiate Screenings" Opioid where
    StartsWith(Lower(Opioid.value as FHIR.string), 'pos')

define "Applicable Because of Positive Cocaine or PCP or Opiates":
    if exists (Common."Opioid Other Than Synthetic Ordered In Last 12 Months")
    then
        "Has Positive Screening for Cocaine in Last 12 Months" or "Has Positive Screening for PCP in Last 12 Months"
    else
        "Has Positive Screening for Cocaine in Last 12 Months" or "Has Positive Screening for PCP in Last 12 Months" or "Has Positive Screening for Opiates in Last 12 Months"

define "Applicable Not Because of Positive Cocaine or PCP or Opiates":
  "Is Perform Drug Screen Recommendation Applicable?"
    and not "Has Positive Screening for Cocaine in Last 12 Months"
    and not "Has Positive Screening for PCP in Last 12 Months"
    and not "Has Positive Screening for Opiates in Last 12 Months"

define "Cocaine Detail":
  if "Has Positive Screening for Cocaine in Last 12 Months"
    then "Cocaine Summary"
    else null

define "Opiates Detail":
  if "Has Positive Screening for Opiates in Last 12 Months"
    then "Opiates Summary"
    else null

define "PCP Detail":
  if "Has Positive Screening for PCP in Last 12 Months"
    then "PCP Summary"
    else null

define "Detail":
    if "Is Perform Drug Screen Recommendation Applicable?"
    then
        'Patients on opioid therapy should have a urine drug test performed every 12 months.'
    else
        if "Applicable Because of Positive Cocaine or PCP or Opiates"
        then
            "Cocaine Detail"&
            "Opiates Detail"&
            "PCP Detail"&
            '<br/>Note: result may be false positive result or indicate patient is occasional user or addicted to the illicit drug.'
        else
            null

define "Indicator":
  'warning'

    /*
        Used only in PlanDefinition
     */
define "Summary":
    if "Is Perform Drug Screen Recommendation Applicable?"
        then 'Annual Urine Screening Check'
        else
        if "Applicable Because of Positive Cocaine or PCP or Opiates"
            then 'Positive Cocaine or PCP or Opiates in Urine Screening'
        else null

define "Urine Drug Screening ProcedureRequest Category":
  FHIR.CodeableConcept {
    coding: {
      FHIR.Coding {
        system: FHIR.uri { value: 'http://terminology.hl7.org/CodeSystem/medicationrequest-category' },
        code: FHIR.code { value: 'outpatient' },
        display: FHIR.string { value: 'Outpatient' }
      }
    }
  }
  /* singleton from (First(
    [Encounter] E
      where E.period starts same day as Today()
      sort by start of period desc
  ).type) */

define "Cocaine And PCP Summary":
  'Positive for Cocaine AND PCP <br/><br/>' +
    "Cocaine Summary" + '<br/>' + "PCP Summary"

define "Opiates Summary":
    if not exists Common."Opioid Other Than Synthetic Ordered In Last 12 Months"
    then
        if "Negative Opiate Screenings Count Since Last Positive Screening" > 0
        then
          '<br/>*Positive for Opiates: ' +
            Combine("Positive Opiate Dates in Lookback Period", ', ') +
            '  (' + ToString("Negative Opiate Screenings Count Since Last Positive Screening") +
            ' negative since)'
        else
          '<br/>*Positive for Opiates: ' +
            Combine("Positive Opiate Dates in Lookback Period", ', ')
    else
        null

define "PCP Summary":
    if "Negative PCP Screenings Count Since Last Positive Screening" > 0
    then
      '<br/>*Positive for PCP: <br/>' +
        Combine("Positive PCP Dates in Lookback Period", ', ') +
        '  (' + ToString("Negative PCP Screenings Count Since Last Positive Screening") +
        ' negative since)'
    else
      '<br/>*Positive for PCP: <br/>' +
        Combine("Positive PCP Dates in Lookback Period", ', ')

define "Cocaine Summary":
    if "Negative Cocaine Screenings Count Since Last Positive Screening" > 0
    then
      '<br/>*Positive for Cocaine: <br/>' +
        Combine("Positive Cocaine Dates in Lookback Period", ', ') +
        '  (' + ToString("Negative Cocaine Screenings Count Since Last Positive Screening") +
        ' negative since)'
    else
      '<br/>*Positive for Cocaine: <br/>' +
      Combine("Positive Cocaine Dates in Lookback Period", ', ')

/*
define "Kick off Sequence":
  if Common."Opioid Other Than Synthetic Ordered In Last 12 Months"
    then
        "Detail"
    else
        if "Any urine drug screenings in past 12 months"
*/
/*
Opioid rec 10 new logic (10/13/2021)
Opioid analgesiac other than synthetic opioid ordered in last 12 months?
    if YES then
        Is there any urine test in last 12 months with a positive result for cocaine, or PCP?
        if NO then STOP
        if YES then
            current alerts/cql
    if NO then
        Is there any urine test in last 12 months with a positive result for opiates, cocaine, or PCP?
            if NO then STYOP
            if YES then new report logic
                List ALL positive test dates for each drug in ascending order with last positive date followed by count of all subsequent negative tests


 */