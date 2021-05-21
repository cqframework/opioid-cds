library OpioidCDSCommonMME version '1.2.3'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OMTKLogicCQL version '1.2.3' called OMTKLogic
include OpioidCDSCommon version '1.2.3' called Common

context Patient

define function Prescriptions(Orders List<MedicationRequest>):
  Orders O
    let
      // NOTE: Assuming medication is specified as a CodeableConcept with a single RxNorm code
      rxNormCode: FHIRHelpers.ToCode((O.medication as FHIR.CodeableConcept).coding[0]),
      medicationName: OMTKLogic.GetMedicationName(rxNormCode),
      // NOTE: Assuming a single dosage instruction element
      dosageInstruction: O.dosageInstruction[0],
      repeat: dosageInstruction.timing.repeat,
      frequency: Coalesce(repeat.frequencyMax.value, repeat.frequency.value),
      period: System.Quantity { value: repeat.period.value, unit: repeat.periodUnit.value },
      doseDescription:
        Coalesce(
          // There should be a conversion from FHIR.SimpleQuantity to System.Quantity
          if dosageInstruction.dose is FHIR.Range
            then ToString(Common.ToQuantity((dosageInstruction.dose as FHIR.Range).low))
                          + '-' + ToString(Common.ToQuantity((dosageInstruction.dose as FHIR.Range).high))
                          + (dosageInstruction.dose as FHIR.Range).high.unit.value
            else ToString(Common.ToQuantity(dosageInstruction.dose)),
            ''
        ),
      frequencyDescription:
        ToString(dosageInstruction.timing.repeat.frequency.value) +
          Coalesce(
            '-' + ToString(dosageInstruction.timing.repeat.frequencyMax.value),
            ''
          )
    return {
      rxNormCode: rxNormCode,
      isDraft: O.status.value = 'draft',
      // NOTE: Assuming asNeeded is expressed as a boolean
      isPRN: dosageInstruction.asNeeded,
      prescription:
        if dosageInstruction.text is not null then
          medicationName + ' ' + dosageInstruction.text.value
        else
          // TODO: Shouldn't need the .value here on asNeededBoolean
          medicationName + ' ' + doseDescription + ' q' + frequencyDescription + (if dosageInstruction.asNeeded then ' PRN' else ''),
      // TODO: Shouldn't need the ToQuantity here...
      dose: if dosageInstruction.dose is FHIR.Range
            then Common.ToQuantity((dosageInstruction.dose as FHIR.Range).high)
            else Common.ToQuantity(dosageInstruction.dose),
      dosesPerDay: Coalesce(OMTKLogic.ToDaily(frequency, period), 1.0)
    }

define function MME(prescriptions List<MedicationRequest>):
  (Prescriptions(prescriptions)) P
    let mmePerIngredient: OMTKLogic.CalculateMMEs({ { rxNormCode: P.rxNormCode, doseQuantity: P.dose, dosesPerDay: P.dosesPerDay } })
    return {
      rxNormCode: P.rxNormCode,
      isDraft: P.isDraft,
      isPRN: P.isPRN,
      prescription: P.prescription,
      dailyDose: Combine(mmePerIngredient X return X.dailyDoseDescription, '\r\n'),
      mme: Sum(mmePerIngredient X return X.mme)
    }

define function TotalMME(prescriptions List<MedicationRequest>):
  System.Quantity {
    value: Sum((MME(prescriptions)) M return M.mme.value),
    unit: 'mg/d'
  }

define function GetIngredient(rxNormCode Code):
  OMTKLogic.GetIngredients(rxNormCode).ingredientName

define function GetIngredients(rxNormCodes List<Code>):
  rxNormCodes rnc return GetIngredient(rnc)
