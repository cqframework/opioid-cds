library OpioidCDS_STU3_REC_10_Patient_View version '0.1.0'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDS_STU3_Common version '0.1.0' called Common

codesystem "V2 Interpretation Codes": 'http://hl7.org/fhir/v2/0078'

// Urine drug screening (procedure) {310627008 , SNOMED-CT }
code "Urine Drug Screening": '310627008' from Common.SNOMED display 'Urine drug screening (procedure)'

/*
** Recommendation #10
** Consider urine drug testing before starting opioid therapy and consider urine
** drug testing at least annually to assess for prescribed medications as well
** as other controlled prescription drugs and illicit drugs
*/

/*
  Trigger context:
    Primary care/ambulatory care
  Trigger event:
    Patient chart is opened
  Assumptions:
    Count only ambulatory prescriptions
  Inclusion criteria:
    Opioid Rx for at least 80 of the past 90 days
      AND
        (No Urine Screening in last 12 months
          OR Evidence of Opioids present
          OR Evidence of Illicit drugs present)
  Exclusion criteria (optional):
    Meds indicating end of life
    Conditions indicating end of life
  Notification:
    No Urine Screening in last 12 months - Patients on opioid therapy should have a urine drug test performed every 12 months.
    Evidence of Opioids - Opioid x present in urine screening
    Evidence of Illicit Drugs - Illicit drug x present in urine screening
    Ref: CDC Recommendation #10.
  EHR expectations:
    Have availability to snooze for 3 months

  Plan Definition:
	http://build.fhir.org/ig/cqframework/opioid-cds/PlanDefinition-opioidcds-10.html
*/

code "Positive": 'POS' from "V2 Interpretation Codes"

context Patient

define "Lookback Year":
  Interval[Today() - 12 months - 1 days, Today() - 1 day]

define "Patient on Opioids with Abuse Potential":
  exists (
    Common."Active Ambulatory Opioid Rx" ActiveOpioidScript
      where not (ActiveOpioidScript.medication in Common."End Of Life Opioids")
  )

define "Inclusion Criteria":
  AgeInYears() >= 18
    and "Patient on Opioids with Abuse Potential"
    and AnyTrue(Common.ProbableDaysInRange(Common."Active Ambulatory Opioid Rx", 90, 80))
    and
      ("No Urine Screening In Last 12 Months"
        or "Has Evidence of Opioids"
        or "Has Evidence of Illicit Drugs")

define "Illicit Drug Urine Screenings in Last 12 Months":
  (
    (
      [Observation: "code" in Common."Illicit Drug Screening"] observation
        where date from observation.effective.value in day of "Lookback Year"
    )
    union (
      [Observation: "component-code" in Common."Illicit Drug Screening"] observation
        where date from observation.effective.value in day of "Lookback Year"
    )
  ) obs
    sort by effective.value

define "Opioid Drug Urine Screenings in Last 12 Months":
  (
    ([Observation: "code" in Common."Opioid Drug Screening"] observation
      where date from observation.effective.value in day of "Lookback Year"
    )
    union (
      [Observation: "component-code" in Common."Opioid Drug Screening"] observation
        where date from observation.effective.value in day of "Lookback Year"
    )
  ) obs
    sort by effective.value

define "Most Recent Illicit Drug Urine Screenings in Last 12 Months":
  Last( "Illicit Drug Urine Screenings in Last 12 Months" )

define "Most Recent Opioid Drug Urine Screenings in Last 12 Months":
  Last( "Opioid Drug Urine Screenings in Last 12 Months" )

define "No Urine Screening In Last 12 Months":
  "Most Recent Illicit Drug Urine Screenings in Last 12 Months" is null
    and "Most Recent Opioid Drug Urine Screenings in Last 12 Months" is null

define "Positive Illicit Drug Screening":
  "Most Recent Illicit Drug Urine Screenings in Last 12 Months" mostRecentScreening
    where FHIRHelpers.ToConcept(mostRecentScreening.interpretation) ~ "Positive"
      or exists (mostRecentScreening.component C
        where C.code in Common."Illicit Drug Screening"
          and FHIRHelpers.ToConcept(C.interpretation) ~ "Positive"
      )

define "Positive Illicit Drug Screening Qualifying Codes":
  "Positive Illicit Drug Screening" positiveScreening
    return
    (
      (
          if (FHIRHelpers.ToConcept(positiveScreening.interpretation) ~ "Positive")
          then { positiveScreening.code }
          else {}
      )
      union
      (
        positiveScreening.component C
          where C.code in Common."Illicit Drug Screening"
            and FHIRHelpers.ToConcept(C.interpretation) ~ "Positive"
          return C.code
      )
    )

define "Has Evidence of Illicit Drugs":
  "Positive Illicit Drug Screening" is not null

define "Positive Opioid Drug Screening":
  "Most Recent Opioid Drug Urine Screenings in Last 12 Months" mostRecentScreening
  where FHIRHelpers.ToConcept(mostRecentScreening.interpretation) ~ "Positive"
    or exists (mostRecentScreening.component C
      where C.code in Common."Opioid Drug Screening"
        and FHIRHelpers.ToConcept(C.interpretation) ~ "Positive"
    )

define "Positive Opioid Drug Screening Qualifying Codes":
  "Positive Opioid Drug Screening" positiveScreening
  return
  (
    (
      if (FHIRHelpers.ToConcept(positiveScreening.interpretation) ~ "Positive")
      then { positiveScreening.code }
      else {}
    )
    union
    (
      positiveScreening.component C
        where C.code in Common."Opioid Drug Screening"
          and FHIRHelpers.ToConcept(C.interpretation) ~ "Positive"
        return C.code
    )
  )

define "Has Evidence of Opioids":
  "Positive Opioid Drug Screening" is not null

define "No Screening In Last 12 Months Indicator":
  if "Inclusion Criteria"
    then 'warning'
  else null

define "Evidence of Opioids Indicator":
  if "Inclusion Criteria"
    then 'warning'
  else null

define "Evidence of Illicit Drugs Indicator":
  if "Inclusion Criteria"
    then 'warning'
  else null

define "No Screening In Last 12 Months Summary":
  if "Inclusion Criteria" and "No Urine Screening In Last 12 Months"
    then 'Annual Urine Screening Check'
  else null

define "Evidence of Opioids Summary":
  if "Inclusion Criteria" and "Has Evidence of Opioids"
    then 'Opioids Found In Urine Screening'
  else null

define "Evidence of Illicit Drugs Summary":
  if "Inclusion Criteria" and "Has Evidence of Illicit Drugs"
    then 'Illicit Drugs Found In Urine Screening'
  else null

define "No Screening In Last 12 Months Detail":
  if "Inclusion Criteria" and "No Urine Screening In Last 12 Months"
    then 'Patients on opioid therapy should have a urine drug test performed every 12 months.'
  else null

define "Evidence of Opioids Detail":
  if "Inclusion Criteria" and "Has Evidence of Opioids"
    then
      'Found the following opioid(s): ' +
        Combine(Common.CodeableConceptsToString("Positive Opioid Drug Screening Qualifying Codes"), ', ')
  else null

define "Evidence of Illicit Drugs Detail":
  if "Inclusion Criteria" and "Has Evidence of Illicit Drugs"
    then
      'Urine drug screening results: ' +
        Combine(Common.CodeableConceptsToString("Positive Illicit Drug Screening Qualifying Codes"), ', ')
      else null

/*
PlanDefinition:
  Inclusion Criteria:
    No Screening in Last 12 months - ServiceRequest - Urine Screening
    Opioids found in urine screening
    Illicit drugs found in urine screening
*/

// Procedure Request - Urine Screening
// Detected Issue - Opioids found in urine screening
// Detected Issue - Illicit drugs found in urine screening

define "Urine Drug Screening Request":
  ProcedureRequest {
    //identifier:,
    definition: { FHIR.Reference { reference: FHIR.string { value: 'http://fhir.org/guides/cdc/activitydefinition/urine-screening-request' } } },
    status: FHIR.RequestStatus { value: 'draft' },
    intent: FHIR.RequestIntent { value: 'proposal' },
    priority: FHIR.RequestPriority { value: 'routine' },
    code: FHIR.CodeableConcept { coding: { ToCoding("Urine Drug Screening") } },
    subject: FHIR.Reference { reference: FHIR.string { value: 'Patient/' + Patient.id } },
    occurrence: FHIR.Period { start: FHIR.dateTime { value: Today() }, end: FHIR.dateTime { value: Today() + 7 days } },
    authoredOn: FHIR.dateTime { value: Now() },
    reasonCode: { FHIR.CodeableConcept { text: FHIR.string { value: "No Screening In Last 12 Months Detail" } } }
    // doesn't really work, need a relatedArtifact here...
    //reasonCode: { FHIR.CodeableConcept { text: FHIR.string { value: 'https://www.cdc.gov/mmwr/volumes/65/rr/rr6501e1.htm#10_When_prescribing_opioids' } } }
  }

define "Opioids Issue":
  DetectedIssue {
    //identifier:,
    status: FHIR.ObservationStatus { value: 'preliminary' },
    category: FHIR.CodeableConcept { text: FHIR.string { value: "Evidence of Opioids Summary" } },
    severity: FHIR.DetectedIssueSeverity { value: 'moderate' },
    patient: FHIR.Reference { reference: FHIR.string { value: 'Patient/' + Patient.id } },
    date: FHIR.dateTime { value: Now() },
    // TODO: Device representation...
    // author:,
    // TODO: Reference the lab results that were used to infer this
    // implicated:,
    detail: FHIR.string { value: "Evidence of Opioids Detail" },
    reference: FHIR.uri { value: 'http://fhir.org/guides/cdc/opioid-cds/PlanDefinition/opioidcds-10-patient-view'}
  }

define "Illicit Drugs Issue":
  DetectedIssue {
    //identifier:,
    status: FHIR.ObservationStatus { value: 'preliminary' },
    category: FHIR.CodeableConcept { text: FHIR.string { value: "Evidence of Illicit Drugs Summary" } },
    severity: FHIR.DetectedIssueSeverity { value: 'moderate' },
    patient: FHIR.Reference { reference: FHIR.string { value: 'Patient/' + Patient.id } },
    date: FHIR.dateTime { value: Now() },
    // TODO: Device representation...
    // author:,
    // TODO: Reference the lab results that were used to infer this
    // implicated:,
    detail: FHIR.string { value: "Evidence of Illicit Drugs Detail" },
    reference: FHIR.uri { value: 'http://fhir.org/guides/cdc/opioid-cds/PlanDefinition/opioidcds-10-patient-view'}
  }

define function ToCoding(code System.Code):
  FHIR.Coding {
    code: FHIR.code { value: code.code },
    system: FHIR.uri { value: code.system },
    version: FHIR.string { value: code.version },
    display: FHIR.string { value: code.display }
  }
