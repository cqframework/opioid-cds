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

parameter ContextPrescription MedicationRequest
parameter Orders List<MedicationRequest> // includes the ContextPrescription
parameter Encounters List<Encounter>
parameter OpioidRiskAssessment List<Procedure>
parameter EndOfLifeConditions List<Condition>

context Patient

define "Validate Trigger Event":
  exists(
    ContextPrescription triggerScript
      where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(triggerScript.medication.coding[0]))
  )

define "Inclusion Criteria":
  "Validate Trigger Event"
    and not "Exclusion Criteria"
    and not exists ("Opioid Risk Assessment in Past 90 Days")
    and
      ((Common.ProbableDaysInRange(Orders, 10, 7) and exists("Encounter in past 12 months"))
        or Common.ProbableDaysInRange(Orders, 90, 63))

define "Exclusion Criteria":
  exists (
    Orders orders
          where Common.IsEndOfLifeOpioid(Common.ToCode(orders.medication.coding[0]))
  )
  or exists(EndOfLifeConditions)

define "Risk Assessment Interval":
  Interval[Today() - 90 days, Today() - 1 day]

define "Opioid Risk Assessment in Past 90 Days":
  OpioidRiskAssessment riskAssessment
    where riskAssessment.performed."start".value in "Risk Assessment Interval"

define "Encounter Interval":
  Interval[Today() - 1 year, Today() - 1 day]

define "Encounter in past 12 months":
  Encounters E
    where E.period."start".value in "Encounter Interval"

define "Get Notification":
  'Patients on opioid therapy should be evaluated for benefits and harms within 1 to 4 weeks of starting opioid therapy and every 3 months or more subsequently.'