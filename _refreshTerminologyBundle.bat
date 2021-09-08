@ECHO OFF

DEL /F /Q bundlegen\opioid-cds-terminology-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

if not exist bundlegen\sourcefiles mkdir bundlegen\sourcefiles

echo refreshing Terminology bundle...
COPY input\vocabulary\codesystem\codesystem-condition-category.json bundlegen\sourcefiles\codesystem-condition-category.json
COPY input\vocabulary\codesystem\codesystem-condition-clinical.json bundlegen\sourcefiles\codesystem-condition-clinical.json
COPY input\vocabulary\codesystem\codesystem-medication-request-category.json bundlegen\sourcefiles\codesystem-medication-request-category.json
COPY input\vocabulary\codesystem\codesystem-medication-request-status.json bundlegen\sourcefiles\codesystem-medication-request-status.json
COPY input\vocabulary\codesystem\codesystem-observation-category.json bundlegen\sourcefiles\codesystem-observation-category.json
COPY input\vocabulary\codesystem\codesystem-uscore-condition-category.json bundlegen\sourcefiles\codesystem-uscore-condition-category.json
COPY input\vocabulary\codesystem\codesystem-opioidcds-indicator.xml bundlegen\sourcefiles\codesystem-opioidcds-indicator.xml

COPY input\vocabulary\valueset\valueset-benzodiazepine-medications.json bundlegen\sourcefiles\valueset-benzodiazepine-medications.json
COPY input\vocabulary\valueset\valueset-buprenorphine-and-methadone-medications.json bundlegen\sourcefiles\valueset-buprenorphine-and-methadone-medications.json
COPY input\vocabulary\valueset\valueset-cdc-malignant-cancer-conditions.json bundlegen\sourcefiles\valueset-cdc-malignant-cancer-conditions.json
COPY input\vocabulary\valueset\valueset-cocaine-urine-drug-screening-tests.json bundlegen\sourcefiles\valueset-cocaine-urine-drug-screening-tests.json
COPY input\vocabulary\valueset\valueset-conditions-documenting-substance-misuse.json bundlegen\sourcefiles\valueset-conditions-documenting-substance-misuse.json
COPY input\vocabulary\valueset\valueset-conditions-likely-terminal-for-opioid-prescribing.json bundlegen\sourcefiles\valueset-conditions-likely-terminal-for-opioid-prescribing.json
COPY input\vocabulary\valueset\valueset-condition-clinical-status-active.json bundlegen\sourcefiles\valueset-condition-clinical-status-active.json
COPY input\vocabulary\valueset\valueset-condition-encounter-diagnosis-category.json bundlegen\sourcefiles\valueset-condition-encounter-diagnosis-category.json
COPY input\vocabulary\valueset\valueset-condition-problem-list-category.json bundlegen\sourcefiles\valueset-condition-problem-list-category.json
COPY input\vocabulary\valueset\valueset-condition-us-core-health-concern-category.json bundlegen\sourcefiles\valueset-condition-us-core-health-concern-category.json
COPY input\vocabulary\valueset\valueSet-extended-release-opioid-with-ambulatory-misuse-potential.json bundlegen\sourcefiles\valueSet-extended-release-opioid-with-ambulatory-misuse-potential.json
COPY input\vocabulary\valueset\valueSet-hospice-disposition.json bundlegen\sourcefiles\valueSet-hospice-disposition.json
COPY input\vocabulary\valueset\valueset-hospice-finding.json bundlegen\sourcefiles\valueset-hospice-findinge.json
COPY input\vocabulary\valueset\valueset-hospice-procedure.json bundlegen\sourcefiles\valueset-hospice-procedure.json
COPY input\vocabulary\valueset\valueset-limited-life-expectancy-conditions.json bundlegen\sourcefiles\valueset-limited-life-expectancy-conditions.json
COPY input\vocabulary\valueset\valueset-medicationrequest-category-community.json bundlegen\sourcefiles\valueset-medicationrequest-category-community.json
COPY input\vocabulary\valueset\valueset-medicationrequest-status-active bundlegen\sourcefiles\valueset-medicationrequest-status-active
COPY input\vocabulary\valueset\valueset-naloxone-medications.json bundlegen\sourcefiles\valueset-naloxone-medications.json
COPY input\vocabulary\valueset\valueset-non-opioid-drug-urine-screening.json bundlegen\sourcefiles\valueset-non-opioid-drug-urine-screening.json
COPY input\vocabulary\valueset\valueset-office-visit.json bundlegen\sourcefiles\valueset-office-visit.json
COPY input\vocabulary\valueset\valueset-observation-category-laboratory.json bundlegen\sourcefiles\valueset-observation-category-laboratory.json
COPY input\vocabulary\valueset\valueset-observation-category-procedure.json bundlegen\sourcefiles\valueset-observation-category-procedure.json
COPY input\vocabulary\valueset\valueset-oncology-specialty-designations.json bundlegen\sourcefiles\valueset-oncology-specialty-designations.json
COPY input\vocabulary\valueset\valueset-opioid-analgesics-with-ambulatory-misuse-potential.json bundlegen\sourcefiles\valueset-opioid-analgesics-with-ambulatory-misuse-potential.json
COPY input\vocabulary\valueset\valueset-opioid-counseling-procedure.json bundlegen\sourcefiles\valueset-opioid-counseling-procedure.json
COPY input\vocabulary\valueset\valueset-opioid-drug-urine-screening.json bundlegen\sourcefiles\valueset-opioid-drug-urine-screening.json
COPY input\vocabulary\valueset\valueset-opioid-misuse-assessment-procedure.json bundlegen\sourcefiles\valueset-opioid-misuse-assessment-procedures.json
COPY input\vocabulary\valueset\valueset-opioid-misuse-disorders.json bundlegen\sourcefiles\valueset-opioid-misuse-disorders.json
COPY input\vocabulary\valueset\valueset-pain-management-procedure.json bundlegen\sourcefiles\valueset-pain-management-procedure.json
COPY input\vocabulary\valueset\valueset-pain-treatment-plan.json bundlegen\sourcefiles\valueset-pain-treatment-plan.json
COPY input\vocabulary\valueset\valueset-pdmp-data-reviewed-finding.json bundlegen\sourcefiles\valueset-pdmp-data-reviewed-findings.json
COPY input\vocabulary\valueset\valueset-pdmp-review-procedure.json bundlegen\sourcefiles\valueset-pdmp-review-procedure.json
COPY input\vocabulary\valueset\valueset-phencyclidine-urine-drug-screening-tests.json bundlegen\sourcefiles\valueset-phencyclidine-urine-drug-screening-tests.json
COPY input\vocabulary\valueset\valueset-substance-misuse-behavioral-counseling.json bundlegen\sourcefiles\valueset-substance-misuse-behavioral-counseling.json
COPY input\vocabulary\valueset\valueset-therapies-indicating-end-of-life-care.json bundlegen\sourcefiles\valueset-therapies-indicating-end-of-life-care.json
COPY input\vocabulary\valueset\valueset-urine-drug-screening-tests.json bundlegen\sourcefiles\valueset-urine-drug-screening-tests.json

rem cd /bundlegen
for %%e in (bundlegen\sourcefiles\*) Do @echo bundling %%e
rem Bundle all resources from bundlegen/sourcefiles
cmd /c bundlegen\_bundle.bat opioid-cds-terminology

DEL /F /Q bundles\opioid-cds-terminology-bundle.json
COPY bundlegen\opioid-cds-terminology-bundle.json bundles\opioid-cds-terminology-bundle.json
echo 'Copied generated bundle to bundles\opioid-cds-terminology-bundle.json'

echo 'Cleaning up bundlegen\sourcefiles...'
DEL /F /Q bundlegen\opioid-cds-terminology-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

echo 'terminology bundle refresh complete.'
