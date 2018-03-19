library OpioidCDS_STU4 version '0.1.0'

using FHIR version '3.2.0'

include OpioidCDS_STU4_Common version '0.1.0' called MMECommon

/*
**
** Recommendation #5
**
*/

parameter UserID String
parameter Orders List<MedicationRequest>

context Patient

define MMETotal:
  MMECommon.TotalMME(Orders)

define IsMME50OrMore:
  MMETotal >= 50 'mg/d'

define getIndicator:
  'warning'

define getSummary:
  'High risk for opioid overdose - '
    + case when MMETotal.value >= 90
       then 'taper now'
       else 'consider tapering'
     end

define getDetail:
  'Total morphine milligram equivalent (MME) is ' + ToString(MMETotal) + '. Taper to less than 50.'
