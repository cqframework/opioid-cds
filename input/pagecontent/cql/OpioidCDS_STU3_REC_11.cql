library OpioidCDS_STU3_REC_11 version '0.1.0'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
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

  Plan Definition:
	http://build.fhir.org/ig/cqframework/opioid-cds/PlanDefinition-opioidcds-11.html
*/

parameter ContextPrescriptions List<MedicationRequest>

context Patient

define "Validate Trigger Event For Benzodiazepine":
  exists(
    ContextPrescriptions TriggerScript
      where if TriggerScript.medication is FHIR.Reference
        then exists (
          [Medication: Common."Benzodiazepines"] BenzodiazepineMedication
            where EndsWith(TriggerScript.medication.reference, BenzodiazepineMedication.id)
        )
        else TriggerScript.medication in Common."Benzodiazepines"
      and (
        FHIRHelpers.ToConcept(TriggerScript.category) ~ Common."Community"
          or (
            Common.IgnoreOutpatientCategorySystem
              and Common.ConceptCodeOnlyEquivalent(TriggerScript.category, Common."Community")
          )
      )
  )
  /* exists(
    ContextPrescriptions triggerScript
      where triggerScript.medication in Common."Benzodiazepines"
  ) */

define "Validate Trigger Event For Ambulatory Care Abuse Potential":
  exists(
    ContextPrescriptions TriggerScript
      where if TriggerScript.medication is FHIR.Reference
        then exists (
          [Medication: Common."Ambulatory Abuse Potential Opioids"] OpioidMedication
            where EndsWith(TriggerScript.medication.reference, OpioidMedication.id)
        )
        else TriggerScript.medication in Common."Ambulatory Abuse Potential Opioids"
      and (
        FHIRHelpers.ToConcept(TriggerScript.category) ~ Common."Community"
          or (
            Common.IgnoreOutpatientCategorySystem
              and Common.ConceptCodeOnlyEquivalent(TriggerScript.category, Common."Community")
          )
      )
  )

define "Inclusion Criteria":
  AgeInYears() >= 18
    and ("Validate Trigger Event For Benzodiazepine"
      or "Validate Trigger Event For Ambulatory Care Abuse Potential")
    and not "Exclusion Criteria"
    and "On Benzodiazepine"
    and "Opioid with Ambulatory Care Abuse Potential"

define "Exclusion Criteria":
  Common."End of Life Assessment"

define "On Benzodiazepine":
  "Validate Trigger Event For Benzodiazepine"
  or exists( Common."Active Ambulatory Benzodiazepine Rx" )

define "Opioid with Ambulatory Care Abuse Potential":
  "Validate Trigger Event For Ambulatory Care Abuse Potential"
  or exists( Common."Active Ambulatory Opioid Rx" )

define "Get Indicator":
  if "Inclusion Criteria"
    then 'warning'
  else null

define "Get Summary":
  if "Inclusion Criteria"
    then 'Avoid prescribing opioid pain medication and benzodiazepine concurrently whenever possible.'
  else null

define "Get Detail":
  if "Inclusion Criteria"
    then
      if "Validate Trigger Event For Benzodiazepine"
        then 'The benzodiazepine prescription request is concurrent with an active opioid prescription'
      else 'The opioid prescription request is concurrent with an active benzodiazepine prescription'
  else null
