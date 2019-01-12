library OpioidCDS_STU3_REC_11_patient_view version '0.1.0'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDSCommonSTU3 version '0.1.0' called Common

/*
**
**  Recommendation #11
**    Patient found to be prescribed opioid pain medication and benzodiazepines. Avoid prescribing opioid pain medication and benzodiazepines concurrently whenever possible
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

context Patient

define "Inclusion Criteria":
  AgeInYears() >= 18
    and (
      exists "Benzo Scripts"
        and exists "Opioid with Abuse Potential Scripts"
    )

define "Benzo Scripts":
  Common."Active Ambulatory Benzodiazepine Rx" BenzoScript
    where not Common."Is Context Prescription End of Life Opioid?"(BenzoScript)

define "Opioid with Abuse Potential Scripts":
  Common."Active Ambulatory Opioid Rx" OpioidScript
    where not Common."Is Context Prescription End of Life Opioid?"(OpioidScript)

define "Get Indicator":
  if "Inclusion Criteria"
    then 'warning'
  else null

define "Get Summary":
  if "Inclusion Criteria"
    then 'Patient has active prescriptions for opioid pain medication and benzodiazepines'
  else null

define "Get Detail":
  if "Inclusion Criteria"
    then 'Avoid prescribing opioid pain medication and benzodiazepines concurrently whenever possible'
  else null
