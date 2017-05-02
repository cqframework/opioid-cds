library OpioidCDS_DSTU2 version '0.1.0'

using FHIR version '1.0.2'

include FHIRHelpers version '1.0.2' called FHIRHelpers

parameter UserID String
parameter Orders List<MedicationOrder>

context Patient

// IsForChronicPain
// TODO: Capture process decisions for long-term opioid use
define IsForChronicPain: true

// HasMetastaticCancer
// TODO: Capture process decisions for metastatic cancer
define HasMetastaticCancer: false

// TODO: Capture process decisions for MME calculation
// TotalMME - Sum of all MME for currently and about-to-be prescribed opioid medications
define TotalMME: 60 'mg/d'

// MME - Milligram Morphine Equivalents as a list of tuples:
// List<Tuple { Prescription String, DailyDose String, ConversionFactor Decimal, MME Quantity }>
define MME: {
  {
    Prescription: 'Oxycodone-acetaminophen 5-325mg (percocet) PO Tablet 2 tabs qid PRN pain',
    DailyDose: 'Oxycodone PO: 10mg * 4 = 40mg',
    ConversionFactor: 1.5,
    MME: 60 'mg/d'
  }
}

/*
Argonaut profiles only support MedicationOrder and MedicationStatement
Epic's fhir documentation indicates the same... https://open.epic.com/Interface/FHIR
Cener's fhir documentation indicates the same... http://fhir.cerner.com/millenium/dstu2

Argonaut's Medication Code is bound to:
http://build.fhir.org/ig/argonautproject/data-query/ValueSet-medication-codes.html
The Argonaut MedicationOrder profile does not require any dosage information
The Argonaut MedicationStatement profile does not require any dosage information
*/

/*
MedicationOrder
  dosageInstruction
    text
    timing
      code
      repeat
        count
        frequency
        period
        when
    asNeeded
    dose
    rate
    maxDosePerPeriod
  dispenseRequest
    numberOfRepeatsAllowed
    quantity
    expectedSupplyDuration
    
*/

/*
MedicationDispense
  quantity
  daysSupply
  dosageInstruction
    text
    timing
      code
      repeat
        count
        frequency
        period
        when
    asNeeded
    dose
    rate
    maxDosePerPeriod
    
*/

/*
MedicationAdministration
  dosage
    quantity
    rate
*/

/*
MedicationStatement
  dosage
    text
    timing
      code
      repeat
        count
        frequency
        period
        when
    asNeeded
    quantity
    rate
    maxDosePerPeriod
*/
