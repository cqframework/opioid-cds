library OpioidCDSREC04PatientView version '1.2.3'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDSCommon version '1.2.3' called Common
include OpioidCDSRoutines version '1.2.3' called Routines
include OpioidCDSCommonConfig version '1.2.3' called Config

/*
**
**  Recommendation #4
**    Prescribe immediate-release opioids instead of extended-release/long-acting (ER/LA) opioids
**
**  When
**    Provider is prescribing an extended release opioid with ambulatory misuse potential in the outpatient setting
**    Prescription is for treating chronic pain.
**    Opioid review is useful for this patient:
**      Patient is 18 or over
**      Patient does not have findings indicating limited life expectancy
**      Patient does not have orders for therapies indicating end of life care
**      Patient is not undergoing active cancer treatment:
**        Patient has had at least 2 encounters within the past year with any diagnosis of cancer
**    Patient is opioid naive:
**      No indication of opioid use in the past 90 days from a prescription, self report, or a dispensing event
**  Then
**    Recommend use of immediate release opioids:
**      Will prescribe immediate release opioid analgesic with ambulatory misuse potential
**      Benefits outweigh risks, snooze 3 months
**      N/A - see comment, snooze 3 months
**
*/

// META: Plan Definition: http://fhir.org/guides/cdc/opioid-cds-r4/PlanDefinition/opioid-cds-04

context Patient

define "Chronic Pain Extended Release Opioid Analgesic with Ambulatory Misuse Potential Prescriptions":
  Common."Active Ambulatory Opioid Rx" AmbulatoryOpioidPrescription
    where Routines."Is Chronic Pain Prescription?"(AmbulatoryOpioidPrescription)
      and AmbulatoryOpioidPrescription.medication in Common."Extended release opioid analgesics with ambulatory misuse potential"

define "Patient Is Being Prescribed Extended Release Opioid Analgesic with Ambulatory Misuse Potential":
  exists ("Chronic Pain Extended Release Opioid Analgesic with Ambulatory Misuse Potential Prescriptions")

define "Is Recommendation Applicable?":
  "Inclusion Criteria"
    and not "Exclusion Criteria"

define "Patient Age Less Than 18":
  if (Config."Age Less than 18 Years Is Enabled") then
    AgeInYearsAt(Today()) < 18
  else
    false

define "Inclusion Criteria":
  "Patient Is Being Prescribed Extended Release Opioid Analgesic with Ambulatory Misuse Potential"
    and not "Patient Age Less Than 18"
    and Routines."Is Opioid Review Useful?"
    and Routines."Is Opioid Naive?"

define "Exclusion Criteria":
  Common."End of Life Assessment"

define "Get Indicator":
  if "Is Recommendation Applicable?"
    then 'warning'
  else null

define "Get Summary":
  if "Is Recommendation Applicable?"
    then 'Recommend use of immediate-release opioids instead of extended release/long acting opioids when starting patient on opioids.'
  else null

define "Get Detail":
  if "Is Recommendation Applicable?"
    then 'The following medication requests(s) release rates should be re-evaluated: '
      + Combine(("Chronic Pain Extended Release Opioid Analgesic with Ambulatory Misuse Potential Prescriptions" M
          return Coalesce(M.medication.text, '<Unable to determine medication name>')), ', ')
  else null

  // Detected Issue - Prescribe immediate-release opioids instead of extended-release/long-acting (ER/LA) opioids

  define "Extended Release Opioid Prescription Issue":
    DetectedIssue {
      //identifier:,
      status: FHIR.ObservationStatus { value: 'preliminary' },
      category: FHIR.CodeableConcept { text: FHIR.string { value: "Get Summary" } },
      severity: FHIR.DetectedIssueSeverity { value: 'moderate' },
      patient: FHIR.Reference { reference: FHIR.string { value: 'Patient/' + Patient.id } },
      date: FHIR.dateTime { value: Now() },
      // TODO: Device representation...
      // author:,
      implicated:
        ("Chronic Pain Extended Release Opioid Analgesic with Ambulatory Misuse Potential Prescriptions") M
          return FHIR.Reference { reference: FHIR.string { value: 'MedicationRequest/' + M.id } },
      detail: FHIR.string { value: "Get Detail" },
      reference: FHIR.uri { value: 'http://fhir.org/guides/cdc/opioid-cds/PlanDefinition/opioidcds-04-patient-view'}
    }
