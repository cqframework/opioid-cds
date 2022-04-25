library OpioidCDSREC10 version '1.2.3'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OpioidCDSCommon version '1.2.3' called Common
include OpioidCDSREC10Common version '1.2.3' called Rec10Common
include OpioidCDSRoutines version '1.2.3' called Routines
include OpioidCDSCommonConfig version '1.2.3' called Config

/*
**  Recommendation #10
**    When prescribing opioids for chronic pain, providers should use urine drug
**    testing before starting opioid therapy and consider urine drug testing at
**    least annually to assess for prescribed medications as well as other controlled
**    prescription drugs and illicit drugs (recommendation category: B, evidence type: 4)
**
**  When
**    Provider is prescribing an opioid analgesic with ambulatory misuse potential in the outpatient setting
**    Prescription is for treating chronic pain.
**    Opioid review is useful for this patient:
**      Patient is 18 or over
**      Patient does not have findings indicating limited life expectancy
**      Patient does not have orders for therapies indicating end of life care
**      Patient is not undergoing active cancer treatment:
**        Patient has had at least 2 encounters within the past year with any diagnosis of cancer
**    Urine drug screening has not been performed in last 12 months
**  Then
**    Recommend urine drug screening
**      Will perform urine screening
**      Not for chronic pain management, snooze 3 months
**      N/A - see comment, snooze 3 months
**
*/

// META: Plan Definition: http://fhir.org/guides/cdc/opioid-cds/PlanDefinition/opioid-cds-10

parameter DraftOrders List<Choice<MedicationRequest, ProcedureRequest, ReferralRequest, VisionPrescription, NutritionOrder>>

context Patient

define "Lookback Year":
  Interval[Today() - 12 months - 1 days, Today() - 1 day]

define "ContextPrescriptions":
  DraftOrders O
  where O is MedicationRequest

define "Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions":
  (Common."Is Opioid Analgesic with Ambulatory Misuse Potential?"(ContextPrescriptions)) AmbulatoryOpioidPrescription
    where Routines."Is Chronic Pain Prescription?"(AmbulatoryOpioidPrescription)

define "Patient Is Being Prescribed Opioid Analgesic with Ambulatory Misuse Potential":
  exists ("Chronic Pain Opioid Analgesic with Ambulatory Misuse Potential Prescriptions")

define "Is Perform Drug Screen Recommendation Applicable?":
  "Patient Is Being Prescribed Opioid Analgesic with Ambulatory Misuse Potential"
    and Rec10Common."Inclusion Criteria"
    and not Rec10Common."Exclusion Criteria"

define "Applicable Because of Positive Cocaine or PCP or Opiates":
  Rec10Common."Applicable Because of Positive Cocaine or PCP or Opiates"

define "Urine Drug Screening ProcedureRequest Category":
  Rec10Common."Urine Drug Screening ProcedureRequest Category"

define "Detail":
  Rec10Common."Get Detail" ("Is Perform Drug Screen Recommendation Applicable?")

define "Indicator":
  Rec10Common."Indicator"

define "Summary":
  Rec10Common."Get Summary" ("Is Perform Drug Screen Recommendation Applicable?")
