library OpioidCDSREC03 version '1.2.3'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDSCommon version '1.2.3' called Common
include OpioidCDSCommonConfig version '1.2.3' called Config
include OpioidCDSRoutines version '1.2.3' called Routines

/*
**
**  Recommendation #3
**    Before starting and periodically during opioid therapy, clinicians should
**    discuss with patients known risks and realistic benefits of opioid therapy
**    and patient and clinician responsibilities for managing therapy
**    (recommendation category: A, evidence type: 3).
**
**  When
**    Provider is prescribing an opioid with ambulatory misuse potential in the outpatient setting
**    Prescription is for treating chronic pain.
**    Opioid review is useful for this patient:
**      Patient is 18 or over
**      Patient does not have findings indicating limited life expectancy
**      Patient does not have orders for therapies indicating end of life care
**      Patient is not undergoing active cancer treatment:
**        Patient has had at least 2 encounters within the past year with any diagnosis of cancer
**    Patient does not have documented discussion of opioid harms and risks in the past 90 days, including today
**  Then
**    Recommend counseling regarding potential opioid harms and risks. Potential actions include:
**      Order counseling
**      Document that counseling was provided
**      Document the reason for not counseling; snooze 3 months
**      N/A - see comment; snooze 3 months
**
*/

// META: Plan Definition: http://fhir.org/guides/cdc/opioid-cds/PlanDefinition/opioid-cds-03

parameter ContextPrescriptions List<MedicationRequest>

context Patient

define "Opioid Harms & Risks Counseling Lookback Period":
  Interval[Today() - 90 days, Today() - 1 days]

define "Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions":
  ( Common."Is Opioid Analgesic with Ambulatory Misuse Potential?"( ContextPrescriptions ) ) AmbulatoryOpioidPrescription
    where Routines."Is Chronic Pain Prescription?"( AmbulatoryOpioidPrescription )

define "Patient Is Being Prescribed Opioid Analgesic with Ambulatory Misuse Potential":
  exists( "Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions" )

define "Is Recommendation Applicable?":
  "Inclusion Criteria"

define "Patient Age Less Than 18":
  if (Config."Age Less than 18 Years Is Enabled") then
    AgeInYearsAt(Today()) < 18
  else
    false

define "Inclusion Criteria":
  "Patient Is Being Prescribed Opioid Analgesic with Ambulatory Misuse Potential"
    and not "Patient Age Less Than 18"
    and Routines."Is Opioid Review Useful?"
    and "No Documented Discussions of Opioid Harms and Risks"

define "No Documented Discussions of Opioid Harms and Risks":
  Config."Opioid Harms & Risks Discussion in Past 90 Days Criteria Enabled"
    and not (
      exists ( "Documented Discussions of Opioid Harms and Risks in Past 90 Days Excluding Today" )
        //or exists ( "Ordered Discussions of Opioid Harms and Risks in Past 90 Days Excluding Today" )
    )

define "Documented Discussions of Opioid Harms and Risks in Past 90 Days Excluding Today":
  [Procedure: Common."Opioid counseling procedure"] P
    where P.performed during day of "Opioid Harms & Risks Counseling Lookback Period"
      and P.status ~ 'completed'

// NOTE: Disabled due to FHIR.AllTypes not supporting ProcedureRequest
/* define "Ordered Discussions of Opioid Harms and Risks in Past 90 Days Excluding Today":
  [ProcedureRequest: Common."Opioid counseling procedure"] SR
    where SR.occurrence during day of "Opioid Harms & Risks Counseling Lookback Period" */

define "Get Indicator":
  if "Is Recommendation Applicable?"
    then 'warning'
  else null

define "Get Summary":
  if "Is Recommendation Applicable?"
    then 'Recommend counseling regarding potential opioid harms and risks'
  else null

define "Get Detail":
  if "Is Recommendation Applicable?"
    then 'Medication requests(s): '
      + Combine(("Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions" M
          return Coalesce(M.medication.text, '<Unable to determine medication name>')), ', ')
  else null
