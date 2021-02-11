@ECHO OFF

DEL /F /Q bundlegen\bundlegen-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

COPY .\input\resources\plandefinition\plandefinition-OpioidCDSREC10PatientView.json bundlegen\sourcefiles\
COPY .\input\resources\plandefinition\plandefinition-OpioidCDSREC11PatientView.json bundlegen\sourcefiles\
COPY .\input\resources\library\FHIRHelpers.json bundlegen\sourcefiles\
COPY .\input\resources\library\OMTKData2019.json bundlegen\sourcefiles\
COPY .\input\resources\library\OMTKLogicCQL.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSCommon.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSCommonConfig.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSRoutines.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSREC10PatientView.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSREC11PatientView.json bundlegen\sourcefiles\
COPY .\input\pagecontent\quick-start-bundles\rec10-medication-1.json bundlegen\sourcefiles\
COPY .\input\pagecontent\quick-start-bundles\rec10-medication-2.json bundlegen\sourcefiles\

for %%e in (bundlegen\sourcefiles\*) Do @echo bundling %%e

cmd /c bundlegen\_bundle.bat

DEL /F /Q input\pagecontent\quick-start-bundles\opioid-cds-content-bundle.json
COPY bundlegen\bundlegen-bundle.json input\pagecontent\quick-start-bundles\opioid-cds-content-bundle.json
echo 'Copied generated bundle to input\pagecontent\quick-start-bundles\opioid-cds-content-bundle.json'

echo 'Cleaning up bundlegen/sourcefiles...'
DEL /F /Q bundlegen\bundlegen-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

echo 'quick start content bundle refresh complete.'

echo refreshing Terminology bundle...
COPY input\vocabulary\codesystem\codesystem-condition-category.json bundlegen\sourcefiles\codesystem-condition-category.json
COPY input\vocabulary\codesystem\codesystem-condition-clinical.json bundlegen\sourcefiles\codesystem-condition-clinical.json
COPY input\vocabulary\codesystem\codesystem-medication-request-category.json bundlegen\sourcefiles\codesystem-medication-request-category.json
COPY input\vocabulary\codesystem\codesystem-medication-request-status.json bundlegen\sourcefiles\codesystem-medication-request-status.json
COPY input\vocabulary\codesystem\codesystem-uscore-condition-category.json bundlegen\sourcefiles\codesystem-uscore-condition-category.json

COPY input\vocabulary\valueset\valueset-benzodiazepine-medications.json bundlegen\sourcefiles\valueset-benzodiazepine-medications.json
COPY input\vocabulary\valueset\valueset-buprenorphine-and-methadone-medications.json bundlegen\sourcefiles\valueset-buprenorphine-and-methadone-medications.json
COPY input\vocabulary\valueset\valueset-cdc-malignant-cancer-conditions.json bundlegen\sourcefiles\valueset-cdc-malignant-cancer-conditions.json
COPY input\vocabulary\valueset\valueset-conditions-likely-terminal-for-opioid-prescribing.json bundlegen\sourcefiles\valueset-conditions-likely-terminal-for-opioid-prescribing.json
COPY input\vocabulary\valueset\valueset-conditions-documenting-substance-misuse.json bundlegen\sourcefiles\valueset-conditions-documenting-substance-misuse.json
COPY input\vocabulary\valueset\valueset-discharge-to-hospice.json bundlegen\sourcefiles\valueset-discharge-to-hospice.json
COPY input\vocabulary\valueset\valueset-end-of-life-care.json bundlegen\sourcefiles\valueset-end-of-life-care.json
COPY input\vocabulary\valueset\valueset-end-of-life-conditions.json bundlegen\sourcefiles\valueset-end-of-life-conditions.json
COPY input\vocabulary\valueset\valueset-extended-release-opioids-with-ambulatory-misuse-potential.json bundlegen\sourcefiles\valueset-extended-release-opioids-with-ambulatory-misuse-potential.json
COPY input\vocabulary\valueset\valueset-hospice-disposition.xml bundlegen\sourcefiles\valueset-hospice-disposition.xml
COPY input\vocabulary\valueset\valueset-hospice-finding.json bundlegen\sourcefiles\valueset-hospice-finding.json
COPY input\vocabulary\valueset\valueset-hospice-procedure.json bundlegen\sourcefiles\valueset-hospice-procedure.json
COPY input\vocabulary\valueset\valueset-limited-life-expectancy-conditions.json bundlegen\sourcefiles\valueset-limited-life-expectancy-conditions.json
COPY input\vocabulary\valueset\valueset-limited-life-expectancy-conditions.json bundlegen\sourcefiles\valueset-limited-life-expectancy-conditions.json
COPY input\vocabulary\valueset\valueset-long-acting-opioids.json bundlegen\sourcefiles\valueset-long-acting-opioids.json
COPY input\vocabulary\valueset\valueset-metastatic-cancer.json bundlegen\sourcefiles\valueset-metastatic-cancer.json
COPY input\vocabulary\valueset\valueset-naloxone-medications.json bundlegen\sourcefiles\valueset-naloxone-medications.json
COPY input\vocabulary\valueset\valueset-naloxone.json bundlegen\sourcefiles\valueset-naloxone.json
COPY input\vocabulary\valueset\valueset-non-opioid-illicit-drug-urine-screening.json bundlegen\sourcefiles\valueset-non-opioid-illicit-drug-urine-screening.json
COPY input\vocabulary\valueset\valueset-office-visit.json bundlegen\sourcefiles\valueset-office-visit.json
COPY input\vocabulary\valueset\valueset-oncology-specialty-designations.json bundlegen\sourcefiles\valueset-oncology-specialty-designations.json
COPY input\vocabulary\valueset\valueset-opioid-abuse-assessment.json bundlegen\sourcefiles\valueset-opioid-abuse-assessment.json
COPY input\vocabulary\valueset\valueset-opioid-analgesics-with-ambulatory-misuse-potential.json bundlegen\sourcefiles\valueset-opioid-analgesics-with-ambulatory-misuse-potential.json
COPY input\vocabulary\valueset\valueset-opioid-counseling-procedure.json bundlegen\sourcefiles\valueset-opioid-counseling-procedure.json
COPY input\vocabulary\valueset\valueset-opioid-drug-urine-screening.json bundlegen\sourcefiles\valueset-opioid-drug-urine-screening.json
COPY input\vocabulary\valueset\valueset-opioid-misuse-assessment-procedure.json bundlegen\sourcefiles\valueset-opioid-misuse-assessment-procedure.json
COPY input\vocabulary\valueset\valueset-opioid-misuse-disorders.json bundlegen\sourcefiles\valueset-opioid-misuse-disorders.json
COPY input\vocabulary\valueset\valueset-opioidcds-indicator.json bundlegen\sourcefiles\valueset-opioidcds-indicator.json
COPY input\vocabulary\valueset\valueset-opioids-abused-in-ambulatory-care.json bundlegen\sourcefiles\valueset-opioids-abused-in-ambulatory-care.json
COPY input\vocabulary\valueset\valueset-opioids.json bundlegen\sourcefiles\valueset-opioids.json
COPY input\vocabulary\valueset\valueset-pain-management-procedure.json bundlegen\sourcefiles\valueset-pain-management-procedure.json
COPY input\vocabulary\valueset\valueset-pain-treatment-plan.json bundlegen\sourcefiles\valueset-pain-treatment-plan.json
COPY input\vocabulary\valueset\valueset-pdmp-data-reviewed-finding.json bundlegen\sourcefiles\valueset-pdmp-data-reviewed-finding.json
COPY input\vocabulary\valueset\valueset-pdmp-review-procedure.json bundlegen\sourcefiles\valueset-pdmp-review-procedure.json
COPY input\vocabulary\valueset\valueset-short-acting-opioids.json bundlegen\sourcefiles\valueset-short-acting-opioids.json
COPY input\vocabulary\valueset\valueset-substance-abuse.json bundlegen\sourcefiles\valueset-substance-abuse.json
COPY input\vocabulary\valueset\valueset-substance-misuse-behavioral-counseling.json bundlegen\sourcefiles\valueset-substance-misuse-behavioral-counseling.json
COPY input\vocabulary\valueset\valueset-therapies-indicating-end-of-life-care.json bundlegen\sourcefiles\valueset-therapies-indicating-end-of-life-care.json
COPY input\vocabulary\valueset\external\valueset-us-core-condition-category.json bundlegen\sourcefiles\valueset-us-core-condition-category.json

rem cd /bundlegen
for %%e in (bundlegen\sourcefiles\*) Do @echo bundling %%e
rem Bundle all resources from bundlegen/sourcefiles
cmd /c bundlegen\_bundle.bat

DEL /F /Q input\pagecontent\quick-start-bundles\opioid-cds-terminology-bundle.json
COPY bundlegen\bundlegen-bundle.json input\pagecontent\quick-start-bundles\opioid-cds-terminology-bundle.json
echo 'Copied generated bundle to input\pagecontent\quick-start-bundles\opioid-cds-terminology-bundle.json'

echo 'Cleaning up bundlegen\sourcefiles...'
DEL /F /Q bundlegen\bundlegen-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

echo 'quick start terminology bundle refresh complete.'
