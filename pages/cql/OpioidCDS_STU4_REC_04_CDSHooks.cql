library OpioidCDS_STU4_REC_04_CDSHooks version '0.1.0'

using FHIR version '3.2.0'

include OpioidCDS_STU4_Common version '0.1.0' called Common

/*
**
**  Recommendation #4
**    Prescribe immediate-release opioids instead of extended-release/long-acting (ER/LA) opioids
**
*/

/*
  Trigger context:
    Primary care/ambulatory care
  Trigger event:
    Prescription of extended release/long acting opioid with ambulatory care abuse potential
  Assumptions:
    Count only ambulatory prescriptions
  Inclusion criteria:
    No opioid with ambulatory care abuse potential prescribed for previous 90 days (excluding today) (so yesterday through 89 days before yesterday, covering 90 days total)
    At least 1 encounter in past 12 months [excluding today] (to make sure this is not just a new patient into the system)
  Notification:
    Recommend use of immediate-release opioids instead of extended release/long acting opioids when starting patient on opioids.
    Ref: CDC Recommendation #4.
  EHR expectations:
    Have availability to snooze if benefits outweigh risks or if not applicable
*/

parameter ContextPrescription MedicationRequest
parameter Orders List<MedicationRequest> // includes the ContextPrescription
parameter Encounters List<Encounter>

context Patient

define "Inclusion Period":
  Interval[Today() - 91 days, Today() - 1 days]

define "Encounter Period":
  Interval[Today() - 1 years - 1 days, Today() - 1 days]

define "Validate Trigger Event":
  exists(
    ContextPrescription triggerScript
      let rxNormCode: Common.ToCode(triggerScript.medication.coding[0])
        where Common.IsOpioidWithAmbulatoryAbusePotential(rxNormCode)
          and Common.IsLongActingOpioid(rxNormCode)
  )

define "Inclusion Criteria":
  "Validate Trigger Event"
  and not "Opioid with Ambulatory Care Abuse Potential in Past 90 Days"
  and exists(
    Encounters encounters
      where encounters.period."start".value in "Encounter Period"
  )

define "Opioid with Ambulatory Care Abuse Potential in Past 90 Days":
  exists(
      Orders orders
        where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(orders.medication.coding[0]))
          and orders.authoredOn.value in "Inclusion Period"
    )

define "Get Notification":
  'Recommend use of immediate-release opioids instead of extended release/long acting opioids when starting patient on opioids.'