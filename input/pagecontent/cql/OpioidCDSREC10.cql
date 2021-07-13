library OpioidCDSREC10 version '1.2.3'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDSCommon version '1.2.3' called Common
include OpioidCDSRoutines version '1.2.3' called Routines
include OpioidCDSCommonConfig version '1.2.3' called Config

valueset "Cocaine Medications": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/cocaine-medications'
valueset "PCP Medications": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/pcp-medications'

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

define "Is Recommendation Applicable?":
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
    and (not "Patient had Urine Screening in Last 12 Months"
      or "Has Positive Screening for Cocaine in Last 12 Months"
      or "Has Positive Screening for PCP in Last 12 Months")

define "Exclusion Criteria":
  false

define "Patient had Urine Screening in Last 12 Months":
  exists ("Urine Screenings during the Last 12 Months")

define "Urine Screenings during the Last 12 Months":
  (
    [Observation: "category" in Common."Observation Category Laboratory"] LabObservations
      where date from LabObservations.effective in day of "Lookback Year"
        and (LabObservations.code in Common."Non-opioid drug urine screening")
        and not (LabObservations.status.value in { 'unknown', 'entered-in-error', 'cancelled' })
  )
  union
  (
    [Observation: "category" in Common."Observation Category Laboratory"] LabObservations
      where date from LabObservations.effective in day of "Lookback Year"
        and (LabObservations.code in Common."Opioid drug urine screening")
        and not (LabObservations.status.value in { 'unknown', 'entered-in-error', 'cancelled' })
  )
  union "Cocaine Screenings"
  union "PCP Screenings"

/*
every pos date in last 12 months then count # neg and report that
most recent POS PCP/cocaine
 then get subsequent neg date > pos based on date of each neg and pos
*/

define "Cocaine Screenings":
[Observation: "category" in Common."Observation Category Laboratory"] LabObservations
 where (date from LabObservations.effective in day of "Lookback Year"
   and (LabObservations.code in "Cocaine Medications")
   and not (LabObservations.status.value in { 'unknown', 'entered-in-error', 'cancelled' })
)

define "PCP Screenings":
[Observation: "category" in Common."Observation Category Laboratory"] LabObservations
 where (date from LabObservations.effective in day of "Lookback Year"
   and (LabObservations.code in "PCP Medications")
   and not (LabObservations.status.value in { 'unknown', 'entered-in-error', 'cancelled' })
)

// Returns a text representation of a dateTime using the CQL `ToString` function.
// @param d - a FHIR dateTime to get text for
// @returns {System.String} the text representation of the dateTime
define function DateTimeText(d FHIR.dateTime):
  ToString(d.value)

define "Positive PCP Screenings":
  "PCP Screenings" PCP where
    StartsWith(Lower(PCP.value as FHIR.string), 'pos')

define "Negative PCP Screenings":
 "PCP Screenings" PCP where
    StartsWith(Lower(PCP.value as FHIR.string), 'neg')

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
    4
/*  Count(
    "Negative PCP Screenings" N where
      DateTimeText(N.effective) >  DateTimeText("MostRecent"("Positive PCP Screenings").effective)
  )
*/

define "Negative Cocaine Screenings Count Since Last Positive Screening":
    3
/*  Count(
    "Negative PCP Screenings" N where
      DateTimeText(N.effective) >  DateTimeText("MostRecent"("Positive PCP Screenings").effective)
  )
*/

define "Positive Cocaine Dates in Lookback Period":
    "Cocaine Screenings" CS
      return
        DateTimeText(CS.effective)

define "Positive PCP Dates in Lookback Period":
    "PCP Screenings" PS
      return
        DateTimeText(PS.effective)

define "Has Positive Screening for Cocaine in Last 12 Months":
  exists "Cocaine Screenings" CS where
     StartsWith(Lower(CS.value as FHIR.string), 'pos')

define "Has Positive Screening for PCP in Last 12 Months":
  exists "PCP Screenings" PCP where
     StartsWith(Lower(PCP.value as FHIR.string), 'pos')

define "Applicable Because of Positive Cocaine or PCP":
 "Is Recommendation Applicable?"
    and ("Has Positive Screening for Cocaine in Last 12 Months" or "Has Positive Screening for PCP in Last 12 Months")

define "Applicable Not Because of Positive Cocaine or PCP":
     "Is Recommendation Applicable?"
        and not "Has Positive Screening for Cocaine in Last 12 Months"
        and not "Has Positive Screening for PCP in Last 12 Months"

define "No Screening In Last 12 Months Detail":
  if "Applicable Not Because of Positive Cocaine or PCP"
    then 'Patients on opioid therapy should have a urine drug test performed every 12 months.'
  else
    null

define "No Screening In Last 12 Months Summary":
  if "Applicable Not Because of Positive Cocaine or PCP"
    then 'Annual Urine Screening Check'
  else
    null

define "No Screening In Last 12 Months Indicator":
  if "Applicable Not Because of Positive Cocaine or PCP"
    then 'warning'
  else
    null

define "Positive Cocaine or PCP  In Last 12 Months Detail":
  if ("Has Positive Screening for Cocaine in Last 12 Months" and "Has Positive Screening for PCP in Last 12 Months")
        then "Cocaine And PCP Summary"
  else if "Has Positive Screening for Cocaine in Last 12 Months"
    then "Cocaine Summary"
  else if "Has Positive Screening for PCP in Last 12 Months"
    then "PCP Summary"
  else
    'Do Nothing'

define "Positive Cocaine or PCP  In Last 12 Months Summary":
  if "Applicable Because of Positive Cocaine or PCP"
    then 'Positive Cocaine or PCP in Urine Screening'
  else
   null

define "Positive Cocaine or PCP  In Last 12 Months Indicator":
  if "Applicable Because of Positive Cocaine or PCP"
    then 'warning'
  else 'info'

  define "Cocaine And PCP Summary":
  'Positive for Cocaine AND PCP <br/><br/>' +
    "Cocaine Summary" + '<br/>' + "PCP Summary"

  define "PCP Summary":
    'Positive for PCP: <br/>' +
    'Positive lab dates:   ' + Combine("Positive PCP Dates in Lookback Period", ', <br/>') + '<br/>' +
    'Negative test count since last Positive: ' + ToString("Negative PCP Screenings Count Since Last Positive Screening")

    define "Cocaine Summary":
    'Positive for Cocaine: <br/>' +
    'Positive lab dates:   ' + Combine("Positive Cocaine Dates in Lookback Period", '<br/>') + '<br/>'
    'Negative test count since last Positive: ' + ToString("Negative Cocaine Screenings Count Since Last Positive Screening")
