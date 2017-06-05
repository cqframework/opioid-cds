library OpioidCDS_STU3 version '0.1.0'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OMTKLogic version '0.1.0' called OMTKLogic

parameter UserID String
parameter Orders List<MedicationRequest>

context Patient

// IsForChronicPain
// TODO: Capture process decisions for long-term opioid use
define IsForChronicPain: true

// HasMetastaticCancer
// TODO: Capture process decisions for metastatic cancer
define HasMetastaticCancer: false

// Prescriptions: rxNormCode, isDraft, isPRN, prescription String, dose Quantity, dosesPerDay Decimal
define Prescriptions:
  Orders O
    let 
      rxNormCode: FHIRHelpers.ToCode(O.medicationCodeableConcept.coding[0]), // NOTE: Assuming medication is specified as a CodeableConcept with a single RxNorm code
      medicationName: OMTKLogic.GetMedicationName(rxNormCode),
      dosageInstruction: O.dosageInstruction[0], // NOTE: Assuming a single dosage instruction element
      repeat: dosageInstruction.timing.repeat,
      frequency: Coalesce(repeat.frequencyMax, repeat.frequency),
      period: System.Quantity { value: repeat.period, unit: repeat.periodUnit },
      periodDescription:
        ToString(repeat.period) +
          Coalesce(
            '-' + ToString(repeat.periodMax),
            ''
          ) + repeat.periodUnit,
      doseDescription: 
        Coalesce(
          ToString(FHIRHelpers.ToQuantity(dosageInstruction.doseQuantity)), // There should be a conversion from FHIR.SimpleQuantity to System.Quantity
          ToString(dosageInstruction.doseRange.low.value) 
            + '-' + ToString(dosageInstruction.doseRange.high.value)
            + dosageInstruction.doseRange.high.unit
        ),
      frequencyDescription:
        ToString(dosageInstruction.timing.repeat.frequency) +
          Coalesce(
            '-' + ToString(dosageInstruction.timing.repeat.frequencyMax),
            ''
          )
    return {
      rxNormCode: rxNormCode,
      isDraft: O.status = 'draft',
      isPRN: dosageInstruction.asNeededBoolean, // NOTE: Assuming asNeeded is expressed as a boolean
      prescription: 
        if dosageInstruction.text is not null then
          medicationName + ' ' + dosageInstruction.text
        else
          medicationName + ' ' + doseDescription + ' q' + periodDescription + (if dosageInstruction.asNeededBoolean.value then ' PRN' else ''), // TODO: Shouldn't need the .value here on asNeededBoolean
      dose: FHIRHelpers.ToQuantity(Coalesce(dosageInstruction.doseQuantity, dosageInstruction.doseRange.high)), // TODO: Shouldn't need the ToQuantity here...
      dosesPerDay: Coalesce(OMTKLogic.ToDaily(frequency, period), 1.0)
    }
    
// MME - Milligram Morphine Equivalents as a list of tuples:
// List<Tuple { rxNormCode: Code, isDraft Boolean, isPRN Boolean, prescription String, dailyDose String, conversionFactor Decimal, mme System.Quantity }>
// function CalculateMMEs(medications List<Tuple { rxNormCode Code, doseQuantity System.Quantity, dosesPerDay Decimal }>):
define MME:
  Prescriptions P
    let mme: SingletonFrom(OMTKLogic.CalculateMMEs({ { rxNormCode: P.rxNormCode, doseQuantity: P.dose, dosesPerDay: P.dosesPerDay } }))
    return {
      rxNormCode: P.rxNormCode,
      isDraft: P.isDraft,
      isPRN: P.isPRN,
      prescription: P.prescription,
      dailyDose: mme.dailyDoseDescription,
      conversionFactor: mme.conversionFactor,
      mme: mme.mme 
    }
    sort by if isDraft then 0 else 1, rxNormCode.code
  
// TODO: Capture process decisions for MME calculation
// TotalMME - Sum of all MME for currently and about-to-be prescribed opioid medications
define TotalMME: System.Quantity { value: Sum(MME M return M.mme.value), unit: 'mg/d' }

define IsMME50OrMore: TotalMME >= 50 'mg/d'

/*
USCore profiles only support MedicationRequest and MedicationStatement, same as Argonaut Data Query
See the DSTU2 Library for more information

USCore's Medication Code is bound to:
http://www.hl7.org/fhir/us/core/ValueSet-us-core-medication-codes.html
The USCore MedicationRequest and MedicationStatement profiles do not require any dosage or frequency information
*/

