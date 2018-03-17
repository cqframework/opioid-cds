library OpioidCDS_STU3_REC_08 version '0.1.0'

using FHIR version '3.0.0'

include OpioidCDS_STU3_Common version '0.1.0' called Common

/*
**
**  Recommendation #8
**    Incorporate into the management plan strategies to mitigate risk;
**    including considering offering naloxone when factors that increase risk for opioid overdose are present
**
*/

/*
  Trigger context:
  	Primary care/ambulatory care
  Trigger event:
    Prescription of opioid with ambulatory care abuse potential
  Assumptions:
    Count only ambulatory prescriptions
  Inclusion criteria (OR):
    Average MME >= 50
    On benzodiazepine
    History of alcohol abuse or drug abuse (in FHIR Condition, which means problem list at this point for many EHRs.  Univ. of Utah has created separate interfaces for pulling in past medical history and encounter diagnosis, but this will not be widely available)
  Exclusion criterion:
    On naloxone
  Notification:
    Consider offering naloxone given following risk factor(s) for opioid overdose: (average MME >= 50/day), (concurrent use of benzodiazepine), (history of alcohol or drug abuse).
    Ref: CDC Recommendation #8.
  Value sets:
    Custom value set for relevant substance abuse (Rob will create)
      This needs to include ICD9 and/or 10
      For now, defining value sets as descendants of:
        ICD10: F10-F19, Mental and behavioral disorders due to psychoactive substance use
        ICD9: 304, Drug dependence and 303, Alcohol dependence syndrome

*/

valueset "Substance Abuse": 'TODO'

parameter ContextPrescription MedicationRequest

context Patient

define "Validate Trigger Event":
  exists(
    ContextPrescription triggerScript
      where Common.IsOpioidWithAmbulatoryAbusePotential(Common.ToCode(triggerScript.medication.coding[0]))
  )

define "Inclusion Criteria":
  "Validate Trigger Event"
  and not "Exclusion Criteria"
  and (
    "MME >= 50 mg/d?"
      or "On Benzodiazepine"
      // TODO - uncomment once valueset is provided
      //or "Has Substance Abuse History"
  )

define "Exclusion Criteria":
  exists(
    [MedicationRequest: Common."Naloxone"]
  )

define "Average MME":
  Common.TotalMME("Get Active Ambulatory Opioid Rx")

define "MME >= 50 mg/d?":
  if "Average MME" is null
    then false
  else "Average MME" >= 50 'mg/d'

define "On Benzodiazepine":
  exists(
    [MedicationRequest: Common."Benzodiazepines"]
  )

define "Has Substance Abuse History":
  exists ( [Condition: "Substance Abuse"] )

define "Get Active Ambulatory Opioid Rx":
  (
    [MedicationRequest: Common."Ambulatory Abuse Potential Opioids"] Rx
      where Rx.status.value = 'active'
        and Rx.category.coding[0].code.value = 'outpatient'
        //and
        //  (Rx.dosageInstruction.asNeeded is null
        //    or not Rx.dosageInstruction.asNeeded.value
  ) union ContextPrescription

define "Get Notification":
  'Consider offering naloxone given following risk factor(s) for opioid overdose: '
      + if "MME >= 50 mg/d?"
          then 'Average MME (' + ToString("Average MME") + ') >= 50 mg/day, '
        else ''
      + if "On Benzodiazepine"
          then 'concurrent use of benzodiazepine, '
        else ''
      // TODO - uncomment once valueset is provided
      //+ if "Has Substance Abuse History"
      //    then 'history of alcohol or drug abuse.'
      //  else ''