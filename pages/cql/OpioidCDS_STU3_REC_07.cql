library OpioidCDS_STU3_REC_07 version '0.1.0'

using FHIR version '3.0.0'

include OpioidCDS_STU3_Common version '0.1.0' called Common

/*
**
**  Recommendation #7
**    Evaluate benefits and harms with patients within 1 to 4 weeks of starting opioid therapy...
**    evaluate benefits and harms of continued therapy with patients every 3 months or more frequently
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
    (Opioid Rx for at least 7 of the past 10 days AND at least 1 encounter in past 12 months [excluding today])
      OR (Opioid Rx for at least 21 of 30 days for each of the past 3 months)
    No assessment of risk for opioid use (see below) within past 90 days (noted as Procedure)
  Exclusion criteria (optional):
    Meds indicating end of life
    Conditions indicating end of life
  Notification:
    Patients on opioid therapy should be evaluated for benefits and harms
    within 1 to 4 weeks of starting opioid therapy and every 3 months or more subsequently.
    Ref: CDC Recommendation #7.
  Value sets:
    Assessment of risk for opioid abuse:
      Assessment of risk for opioid abuse (procedure) SCTID: 454281000124100
      High risk drug monitoring (regime/therapy): SCTID: 268525008
  EHR expectations:
    If not able to document/retrieve above procedure,
    then use EHR snoozing functionality to allow "Have assessed/will assess. Snooze 3 months."
*/

codesystem "SNOMED": 'http://snomed.info/sct'

// valueset "End Of Life Conditions": 'TODO'

code "Assessment of risk for opioid abuse": '454281000124100' from "SNOMED"
code "High risk drug monitoring": '268525008' from "SNOMED"

parameter ContextPrescriptions List<MedicationRequest>

context Patient

define "Risk Assessment Interval":
  Interval[Today() - 91 days, Today() - 1 day]

define "Encounter Interval":
  Interval[Today() - 12 months - 1 days, Today() - 1 day]

define "Validate Trigger Event":
  exists(
    ContextPrescriptions triggerScript
      where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(triggerScript.medication.coding[0]))
  )

define "Inclusion Criteria":
  "Validate Trigger Event"
    and not "Exclusion Criteria"
    and not exists ( "Opioid Risk Assessment in Past 90 Days" )
    and ( "Rx Active 7 of Past 10 Days With Encounter" or "Rx Active 63 of Past 90 Days" )

define "Exclusion Criteria":
  exists ( "Medications Indicating End Of Life" )
  // or exists( "Conditions Indicating End Of Life )

define "Medications Indicating End Of Life":
  [MedicationRequest: Common."End Of Life Opioids"] endOfLifeRx
    where endOfLifeRx.status.value = 'active'

// TODO - need valueset for this
// define "Conditions Indicating End Of Life":
//   [Condition: "End Of Life Conditions"] endOfLifeConditions
//     where endOfLifeConditions.clinicalStatus.value = 'active'

define "Opioid Risk Assessment in Past 90 Days":
  ([Procedure: "Assessment of risk for opioid abuse"]
      union [Procedure: "High risk drug monitoring"]) riskAssessment
    where
      riskAssessment.performed."start".value in "Risk Assessment Interval"

define "Encounter in past 12 months":
  [Encounter] E
    where E.period."start".value in "Encounter Interval"

define "Get Active Ambulatory Opioid Rx":
  [MedicationRequest: Common."Ambulatory Abuse Potential Opioids"] Rx
    where Rx.status.value = 'active'
      and Rx.category.coding[0].code.value = 'outpatient'
      //and
      //  (Rx.dosageInstruction.asNeeded is null
      //    or not Rx.dosageInstruction.asNeeded.value)

define "Rx Active 7 of Past 10 Days With Encounter":
  AnyTrue(Common.ProbableDaysInRange("Get Active Ambulatory Opioid Rx", 10, 7)) and exists("Encounter in past 12 months")

define "Rx Active 63 of Past 90 Days":
  AnyTrue(Common.ProbableDaysInRange("Get Active Ambulatory Opioid Rx", 90, 63))

define "Get Indicator":
  'warning'

define "Get Summary":
  'Patients on opioid therapy should be evaluated for benefits and harms within 1 to 4 weeks of starting opioid therapy and every 3 months or more subsequently.'

define "Get Detail":
  if "Rx Active 63 of Past 90 Days"
    then 'No evaluation for benefits and harms associated with opioid therapy has been performed for the patient in the past 3 months'
  else 'No evaluation for benefits and harms has been performed for the patient starting opioid therapy'