library OpioidCDS_STU4 version '0.1.0'

using FHIR version '3.2.0'

include OpioidCDS_STU4_Common version '0.1.0' called MMECommon

/*
**
** Recommendation #5
**
*/

parameter UserID String
parameter ContextPrescriptions List<MedicationRequest>

context Patient

define "Total MME":
  MMECommon.TotalMME(ContextPrescriptions union "Get Active Prescriptions")

define "Is MME 50 Or More?":
  "Total MME" >= 50 'mg/d'

define "Get Active Prescriptions":
  [MedicationRequest] activeRx
    where activeRx.status.value = 'active'
    and activeRx.category.coding[0].code.value = 'outpatient'

define "Get Indicator":
  'warning'

define "Get Summary":
  'High risk for opioid overdose - '
    + case when "Total MME".value >= 90
       then 'taper now'
       else 'consider tapering'
     end

define "Get Detail":
  'Total morphine milligram equivalent (MME) is ' + ToString("Total MME") + '. Taper to less than 50.'
