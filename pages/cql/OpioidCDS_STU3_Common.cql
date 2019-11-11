library OpioidCDS_STU3_Common version '0.1.0'

using FHIR version '3.0.0'

include FHIRHelpers version '3.0.0' called FHIRHelpers
include OMTKLogic version '0.0.1' called OMTKLogic

codesystem "SNOMED": 'http://snomed.info/sct'
codesystem "Medication Request Category Codes": 'http://hl7.org/fhir/medication-request-category'

valueset "Benzodiazepines": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/benzodiazepines'
// TODO: Fix this name
valueset "End of Life Conditions": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/end-of-life-conditions'
// Harvested from VSAC - OID: 2.16.840.1.113762.1.4.1108.15
// NOTE: This harvest note is incorrect, none of the following 3 value sets contain any of the codes in the above referenced valueset
// Rob will construct an appropriate hospice value set aligned with current eCQM program usage and we will use that when available
valueset "Hospice Disposition": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/hospice-disposition'
valueset "Hospice Finding Codes": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/hospice-finding'
valueset "Hospice Procedure Codes": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/hospice-procedure'
valueset "Illicit Drug Screening": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/illicit-drug-urine-screening'
// Harvested from VSAC - OID: 2.16.840.1.113883.3.526.3.1259
valueset "Limited Life Expectancy Conditions": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/limited-life-expectancy-conditions'
valueset "Long Acting Opioids": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/long-acting-opioids'
valueset "Naloxone": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/naloxone'
valueset "Risk Assessment": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/opioid-abuse-assessment'
valueset "Opioid Drug Screening": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/opioid-urine-screening'
valueset "Ambulatory Abuse Potential Opioids": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/opioids-abused-in-ambulatory-care'
valueset "Substance Abuse": 'http://fhir.org/guides/cdc/opioid-cds/ValueSet/substance-abuse'

code "Referral to Hospice": '306205009' from "SNOMED"
code "Community": 'community' from "Medication Request Category Codes"

// TODO: Capture process decisions for long-term opioid use
define IsForChronicPain: true

// Some systems do not include the "system" attribute in the cateogry element of a MedicationRequest.
// Though this is not explicitly non-conformant, it is a suggested best-practice to communicate the
// system when known. In the absence of the system, given that the category binding is preferred, using
// the code only is acceptable. However, this is introduced as a configuration option to 1) Track that this
// is not the ideal behavior, and 2) Enable it to be used only when necessary due to system behaviors.
define IgnoreOutpatientCategorySystem: true

define function CodeOnlyEquivalent(code1 Code, code2 Code):
  code1.code ~ code2.code

define function ConceptCodeOnlyEquivalent(concept Concept, code Code):
  exists (concept.codes C
	  where C.code ~ code.code
	)

define "Active Ambulatory Opioid Rx":
  (
    "Is Active Ambulatory Medication Request?"([MedicationRequest: "Ambulatory Abuse Potential Opioids"])
  )
    union
    (
        ("Is Active Ambulatory Medication Request?"([MedicationRequest])) Rx
          let Med: [Medication: id in (Last(Split(Rx.medication.reference, '/')))]
          where Med.code in "Ambulatory Abuse Potential Opioids"
          return
            MedicationRequest {
              id: Rx.id,
              status: Rx.status,
              intent: Rx.intent,
              category: Rx.category,
              medication: First(Med.code),
              subject: Rx.subject,
              recorder: Rx.recorder,
              dosageInstruction: Rx.dosageInstruction,
              dispenseRequest: Rx.dispenseRequest
            }
    )

define "Active Ambulatory Benzodiazepine Rx":
  (
    "Is Active Ambulatory Medication Request?"([MedicationRequest: "Benzodiazepines"])
  )
  union
  (
      ("Is Active Ambulatory Medication Request?"([MedicationRequest])) Rx
        let Med: [Medication: id in (Last(Split(Rx.medication.reference, '/')))]
        where Med.code in "Benzodiazepines"
        return
          MedicationRequest {
            id: Rx.id,
            status: Rx.status,
            intent: Rx.intent,
            category: Rx.category,
            medication: First(Med.code),
            subject: Rx.subject,
            recorder: Rx.recorder,
            dosageInstruction: Rx.dosageInstruction,
            dispenseRequest: Rx.dispenseRequest
          }
  )

define "Active Ambulatory Naloxone Rx":
  (
    "Is Active Ambulatory Medication Request?"([MedicationRequest: "Naloxone"])
  )
  union
  (
      ("Is Active Ambulatory Medication Request?"([MedicationRequest])) Rx
        let Med: [Medication: id in (Last(Split(Rx.medication.reference, '/')))]
        where Med.code in "Naloxone"
        return
          MedicationRequest {
            id: Rx.id,
            status: Rx.status,
            intent: Rx.intent,
            category: Rx.category,
            medication: First(Med.code),
            subject: Rx.subject,
            recorder: Rx.recorder,
            dosageInstruction: Rx.dosageInstruction,
            dispenseRequest: Rx.dispenseRequest
          }
  )

define "Ambulatory Opioid Rx":
  [MedicationRequest: "Ambulatory Abuse Potential Opioids"] Rx
		  where FHIRHelpers.ToConcept(Rx.category) ~ "Community"
			  or (IgnoreOutpatientCategorySystem and ConceptCodeOnlyEquivalent(Rx.category, "Community"))

define "End of Life Assessment":
  // 1. Conditions indicating end of life or with limited life expectancy
  exists (
    (
      [Condition] C
        where C.clinicalStatus.value in { 'active', 'recurrence' }
        and C.code in "End of Life Conditions"
    )
    union
    (
      [Condition] C
        where C.clinicalStatus.value in { 'active', 'recurrence' }
        and C.code in "Limited Life Expectancy Conditions"
    )
  )
  // 2. Admitted/referred/discharged to hospice care
/*
BTR -> Removing this block as it contains exceptions that are represented using
resources not covered by the US Core implementation guide and so not likely to
be available in most systems. We will reintroduce this with an option in the R4
version.
Specifically, ReferralRequest and ProcedureRequest are not covered by US Core profiles.

  or exists (
    (
      [ReferralRequest: type in "Referral to Hospice"] RR
        where RR.status.value in { 'active', 'completed' }
    )
    union
    (
      [Procedure: code in "Hospice Procedure Codes"] P
        where P.status.value in { 'in-progress', 'completed' }
    )
    union
    (
      [ProcedureRequest: code in "Hospice Procedure Codes"] E
        where E.status.value in { 'planned', 'arrived', 'in-progress', 'finished', 'onleave' }
    )
    union
    (
      [Observation: code in "Hospice Finding Codes"] O
        where not (O.status.value in { 'unknown', 'entered-in-error', 'cancelled' })
    )
    union
    (
      [Encounter] E
        where
          (
            if E.hospitalization.dischargeDisposition.coding is null
                or not exists (E.hospitalization.dischargeDisposition.coding)
              then false
            else E.hospitalization.dischargeDisposition in "Hospice Disposition"
          )
          and E.status.value in { 'planned', 'arrived', 'in-progress', 'finished', 'onleave' }
    )
  )
*/

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
            else ToString(ToQuantity(dosageInstruction.dose)),
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
      if (repeat * supplyDuration) < numDaysInDaysPast then false
      else
        (dosesPerDay * ((repeat * supplyDuration) / validityPeriod) * (daysPast - endDifference)) >= numDaysInDaysPast

define function GetPeriodDays(value System.String):
  case
    when value = 'a' then 365.0
    when value = 'mo' then 30.0
    when value = 'h' then 1.0/24.0
    when value = 'min' then 1.0/24.0*60.0
    when value = 's' then 1.0/24.0*60.0*60.0
    when value = 'ms' then 1.0/24.0*60.0*60.0*1000.0
    else 1.0
  end

  define function GetDurationInDays(value FHIR.Duration):
    case
      when (StartsWith(value.code.value, 'a') or StartsWith(value.unit.value, 'a')) then value.value.value * 365.0
      when (StartsWith(value.code.value, 'mo') or StartsWith(value.unit.value, 'mo')) then value.value.value * 30.0
      when (StartsWith(value.code.value, 'wk') or StartsWith(value.unit.value, 'wk')) then value.value.value * 7.0
      when (StartsWith(value.code.value, 'd') or StartsWith(value.unit.value, 'd')) then value.value.value
      when (StartsWith(value.code.value, 'h') or StartsWith(value.unit.value, 'h')) then value.value.value / 24.0
      when (StartsWith(value.code.value, 'min') or StartsWith(value.unit.value, 'min')) then value.value.value / 60.0 / 24.0
      when (StartsWith(value.code.value, 's') or StartsWith(value.unit.value, 's')) then value.value.value / 60.0 / 60.0 / 24.0
      when (StartsWith(value.code.value, 'ms') or StartsWith(value.unit.value, 'ms')) then value.value.value / 60.0 / 60.0 / 24.0 / 1000.0
      else Message(1000, true, 'Undefined', 'Error', 'Unsupported duration unit code')
    end

define function GetIngredient(rxNormCode Code):
  OMTKLogic.GetIngredients(rxNormCode).ingredientName

define function GetIngredients(rxNormCodes List<Code>):
  rxNormCodes rnc return GetIngredient(rnc)

define function GetMedicationNames(medications List<MedicationRequest>):
  medications M
    return OMTKLogic.GetIngredients(ToRxNormCode(M.medication.coding)).rxNormCode.display

/*
*  Conversion Functions
*/

define function CodeableConceptsToString(concepts List<FHIR.CodeableConcept>):
  concepts c return CodeableConceptToString(c)

define function CodeableConceptToString(concept FHIR.CodeableConcept):
  if (concept is null)
  then null
  else
    'CodeableConcept { ' &
      Combine(
        (concept.coding C
          return
            'Coding { ' &
              'code: ' & C.code &
              ' system: ' & C.system &
              ' version: ' & C.version &
              ' display: ' & C.display &
            ' }'
        ),
        ','
      ) &
   ' }'

define function ToCode(coding FHIR.Coding):
  System.Code {
    code: coding.code.value,
    system: coding.system.value,
    version: coding.version.value,
    display: coding.display.value
  }

define function ToCodes(coding List<FHIR.Coding>):
  coding c return ToCode(c)

define function ToRxNormCode(coding List<FHIR.Coding>):
  singleton from (
    coding C where C.system = 'http://www.nlm.nih.gov/research/umls/rxnorm'
  )

define function ToQuantity(quantity FHIR.Quantity):
  if quantity.code.value is not null
    then System.Quantity { value: quantity.value.value, unit: quantity.code.value }
  else System.Quantity { value: quantity.value.value, unit: quantity.unit.value }

define function "Is Active Ambulatory Medication Request?" (value List<FHIR.MedicationRequest>) returns List<FHIR.MedicationRequest>:
  value Rx
  where Rx.status.value = 'active'
    and (FHIRHelpers.ToConcept(Rx.category) ~ "Community"
      or (IgnoreOutpatientCategorySystem and ConceptCodeOnlyEquivalent(Rx.category, "Community"))
    )
