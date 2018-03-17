library OpioidCDS_STU3_Common version '0.1.0'

using FHIR version '3.0.0'

include OMTKLogic version '0.1.0' called OMTKLogic

valueset "Benzodiazepines": 'benzodiazepines'
valueset "Naloxone": 'naloxone'
valueset "Ambulatory Abuse Potential Opioids": 'opioids-abused-in-ambulatory-care'
valueset "End Of Life Opioids": 'opioids-indicating-end-of-life'
valueset "Long Acting Opioids": 'long-acting-opioids'
valueset "Illicit Drug Screening": 'illicit-drug-urine-screening'
valueset "Opioid Drug Screening": 'opioid-urine-screening'

// The following ValueSets are not currently used for any of the recommendations (4, 5, 7, 8, 10, and 11)
valueset "Opioids": 'opioids'
valueset "Codeine Cough Meds": 'opioids-codeine-cough-meds'
valueset "Short Acting Opioids": 'short-acting-opioids'

// TODO: Capture process decisions for long-term opioid use
define IsForChronicPain: true

// TODO: Capture process decisions for metastatic cancer
define HasMetastaticCancer: false

define function Prescriptions(Orders List<MedicationRequest>):
  Orders O
    let
      // NOTE: Assuming medication is specified as a CodeableConcept with a single RxNorm code
      rxNormCode: ToCode(O.medication.coding[0]),
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
            then ToString(ToQuantity(dosageInstruction.dose.low))
                          + '-' + ToString(ToQuantity(dosageInstruction.dose.high))
                          + dosageInstruction.dose.high.unit.value
            else ToString(ToQuantity(dosageInstruction.dose))
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
      isPRN: dosageInstruction.asNeeded.value,
      prescription:
        if dosageInstruction.text is not null then
          medicationName + ' ' + dosageInstruction.text.value
        else
          // TODO: Shouldn't need the .value here on asNeededBoolean
          medicationName + ' ' + doseDescription + ' q' + frequencyDescription + (if dosageInstruction.asNeeded.value then ' PRN' else ''),
      // TODO: Shouldn't need the ToQuantity here...
      dose: if dosageInstruction.dose is FHIR.Range
            then ToQuantity(dosageInstruction.dose.high)
            else ToQuantity(dosageInstruction.dose),
      dosesPerDay: Coalesce(OMTKLogic.ToDaily(frequency, period), 1.0)
    }

define function MME(prescriptions List<MedicationRequest>):
  (Prescriptions(prescriptions)) P
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
    // sort by if isDraft then 0 else 1, rxNormCode.code

define function TotalMME(prescriptions List<MedicationRequest>):
  System.Quantity {
    value: Sum((MME(prescriptions)) M return M.mme.value),
    unit: 'mg/d'
  }

define function ProbableDaysInRange(Orders List<MedicationRequest>, daysPast Integer, numDaysInDaysPast Integer):
  Orders orders
    let
      frequency: orders.dosageInstruction[0].timing.repeat.frequency.value,
      period: orders.dosageInstruction[0].timing.repeat.period.value,
      periodDays: GetPeriodDays(orders.dosageInstruction[0].timing.repeat.periodUnit.value),
      dosesPerDay:
        if (frequency / (period * periodDays)) >= 1.0
        then 1.0
        else frequency / (period * periodDays),
      repeat: orders.dispenseRequest.numberOfRepeatsAllowed.value,
      supplyDuration: GetDurationInDays(orders.dispenseRequest.expectedSupplyDuration),
      validityPeriod: days between orders.dispenseRequest.validityPeriod."start".value and Today(),
      endDifference:
        if orders.dispenseRequest.validityPeriod."end".value < Today()
        then days between orders.dispenseRequest.validityPeriod."end".value and Today()
        else 0
    return
      (dosesPerDay * ((repeat * supplyDuration) / validityPeriod) * (daysPast - endDifference)) >= numDaysInDaysPast

define function GetPeriodDays(value System.String):
  case
    when StartsWith(value, 'year') then 365.0
    when StartsWith(value, 'month') then 30.0
    when StartsWith(value, 'hour') then 1.0/24.0
    when StartsWith(value, 'minute') then 1.0/24.0*60.0
    else 1.0
  end

define function GetDurationInDays(value FHIR.Duration):
  case
    when StartsWith(value.unit.value, 'year') then value.value.value * 365.0
    when StartsWith(value.unit.value, 'month') then value.value.value * 30.0
    else value.value.value
  end

define function ToCode(coding FHIR.Coding):
  System.Code {
    code: coding.code.value,
    system: coding.system.value,
    version: coding.version.value,
    display: coding.display.value
  }

define function ToQuantity(quantity FHIR.Quantity):
  System.Quantity { value: quantity.value.value, unit: quantity.unit.value }

define function IsNaloxone(rxNormCode Code):
  rxNormCode in "Naloxone"

define function IsBenzodiazepine(rxNormCode Code):
  rxNormCode in "Benzodiazepines"

define function IsOpioidWithAmbulatoryAbusePotential(rxNormCode Code):
  rxNormCode in "Ambulatory Abuse Potential Opioids"

define function IsLongActingOpioid(rxNormCode Code):
  rxNormCode in "Long Acting Opioids"

define function IsEndOfLifeOpioid(rxNormCode Code):
  rxNormCode in "End Of Life Opioids"

define function IsOpioidDrugScreen(observationCode Code):
  observationCode in "Opioid Drug Screening"

define function IsIllicitDrugScreen(observationCode Code):
  observationCode in "Illicit Drug Screening"

define function GetIngredient(rxNormCode Code):
  OMTKLogic.GetIngredients(rxNormCode).ingredientName