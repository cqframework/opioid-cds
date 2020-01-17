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

context Patient

define "Lookback Year":
  Interval[Today() - 12 months - 1 days, Today() - 1 day]

define "Inclusion Criteria":
  AgeInYears() >= 18
    and "Patient Currently Prescribed Opioids"
    and not "Patient had Urine Screening in Last 12 Months"

define "Patient Currently Prescribed Opioids":
  exists(
    Common."Active Ambulatory Opioid Rx" AmbulatoryOpioidPrescription
      where(
        difference in days between AmbulatoryOpioidPrescription.authoredOn and Today()
          <= AmbulatoryOpioidPrescription.dispenseRequest.expectedSupplyDuration.value
      )
  )

define "Patient had Urine Screening in Last 12 Months":
  exists("Urine Screenings during the Last 12 Months")

define "Urine Screenings during the Last 12 Months":
  (
    [Observation: "code" in Common."Illicit Drug Screening"] IllicitDrugScreen
      where date from IllicitDrugScreen.effective in day of "Lookback Year"
  )
  union
  (
    [Observation: "code" in Common."Opioid Drug Screening"] OpioidDrugScreen
      where date from OpioidDrugScreen.effective in day of "Lookback Year"
  )

define "No Screening In Last 12 Months Indicator":
  if "Inclusion Criteria"
    then 'warning'
  else null

define "No Screening In Last 12 Months Summary":
  if "Inclusion Criteria"
    then 'Annual Urine Screening Check'
  else null

define "No Screening In Last 12 Months Detail":
  if "Inclusion Criteria"
    then 'Patients on opioid therapy should have a urine drug test performed every 12 months.'
  else null
