library OpioidCDS_STU3_REC_11_CDSHooks version '0.1.0'

using FHIR version '3.0.0'

include OpioidCDS_STU3_Common version '0.1.0' called Common

/*
**
**  Recommendation #11
**    Avoid prescribing opioid pain medication and benzodiazepines concurrently whenever possible
**
*/

/*
  Trigger context:
    Primary care/ambulatory care
  Trigger event:
    Prescription of benzodiazepine or opioid with ambulatory care abuse potential
  Assumptions:
    Count only ambulatory prescriptions
  Inclusion criteria:
    On both opioid with ambulatory care abuse potential and benzodiazepine
  Notification:
    Avoid prescribing opioid pain mediation and benzodiazepine concurrently whenever possible.
    Ref: CDC Recommendation #11.
  EHR expectations:
    Have availability to snooze if benefits outweigh risks
*/

parameter ContextPrescription MedicationRequest
parameter Orders List<MedicationRequest>

context Patient

define "Validate Trigger Event For Benzodiazepine":
  exists(
    ContextPrescription triggerScript
      where Common.IsBenzodiazepine(Common.ToCode(triggerScript.medication.coding[0]))
  )

define "Validate Trigger Event For Ambulatory Care Abuse Potential":
  exists(
    ContextPrescription triggerScript
      where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(triggerScript.medication.coding[0]))
  )

define "Inclusion Criteria":
  ("Validate Trigger Event For Benzodiazepine"
    or "Validate Trigger Event For Ambulatory Care Abuse Potential")
    and "On Benzodiazepine"
    and "Opioid with Ambulatory Care Abuse Potential"

define "On Benzodiazepine":
 "Validate Trigger Event For Benzodiazepine"
 or exists(
   Orders orders
     where Common.IsBenzodiazepine(Common.ToCode(orders.medication.coding[0]))
 )

define "Opioid with Ambulatory Care Abuse Potential":
  "Validate Trigger Event For Ambulatory Care Abuse Potential"
  or exists(
    Orders orders
      where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(orders.medication.coding[0]))
  )

define "Get Notification":
  'Avoid prescribing opioid pain mediation and benzodiazepine concurrently whenever possible.'