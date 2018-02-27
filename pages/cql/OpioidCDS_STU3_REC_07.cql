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
      exists (
        "Probable Days Triggers" inputs
          where
            (inputs.trigger7InPast10 and exists("Encounter in past 12 months"))
              or inputs.trigger63InPast90
      )

define "Exclusion Criteria":
  exists (
    Orders orders
          where Common.IsEndOfLifeOpioid(Common.ToCode(orders.medication.coding[0]))
  )
  or exists(EndOfLifeConditions)

define "Probable Days Triggers":
  Orders orders
    let
      frequency: orders.dosageInstruction[0].timing.repeat.frequency.value,
      period: orders.dosageInstruction[0].timing.repeat.period.value,
      periodDays: GetPeriodDays(orders.dosageInstruction[0].timing.repeat.periodUnit.value),
      dosesPerDay:
        if (frequency / (period * periodDays)) >= 1.0
        then 1.0
        else frequency / (period * periodDays),
      repeat: orders.dispenseRequest.numberOfRepeatsAllowed.value,
      supplyDuration: GetDurationInDays(orders.dispenseRequest.expectedSupplyDuration),
      validityPeriod: days between orders.dispenseRequest.validityPeriod."start".value and Today(),
      endDifference:
        if orders.dispenseRequest.validityPeriod."end".value < Today()
        then days between orders.dispenseRequest.validityPeriod."end".value and Today()
        else 0
    where
      // TODO - Checking for opioid here... Perhaps should only check for opioid with abuse potential?
      Common.IsOpioid(Common.ToCode(orders.medication.coding[0]))
      // and orders.status.value = 'completed'
      and orders.category.coding[0].code.value = 'outpatient'
    return {
      trigger7InPast10: (dosesPerDay * ((repeat * supplyDuration) / validityPeriod) * (10 - endDifference)) >= 7,
      trigger63InPast90: (dosesPerDay * ((repeat * supplyDuration) / validityPeriod) * (90 - endDifference)) >= 63
    }

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

define function GetPeriodDays(value System.String):
  case
    when StartsWith(value, 'year') then 365.0
    when StartsWith(value, 'month') then 30.0
    when StartsWith(value, 'hour') then 1.0/24.0
    when StartsWith(value, 'minute') then 1.0/24.0*60.0
    else 1.0
  end

define function GetDurationInDays(value FHIR.Duration):
  case
    when StartsWith(value.unit.value, 'year') then value.value.value * 365.0
    when StartsWith(value.unit.value, 'month') then value.value.value * 30.0
    else value.value.value
  end

define "Get Notification":
  'Patients on opioid therapy should be evaluated for benefits and harms within 1 to 4 weeks of starting opioid therapy and every 3 months or more subsequently.'