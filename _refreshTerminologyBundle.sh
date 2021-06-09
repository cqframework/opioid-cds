#!/bin/bash
rm bundlegen/opioid-cds-terminology-bundle.json
rm bundlegen/sourcefiles/*

mkdir -p bundlegen/sourcefiles

# refreshing Terminology bundles
echo refreshing terminology bundle...
cp input/vocabulary/codesystem/codesystem-condition-category.json bundlegen/sourcefiles/codesystem-condition-category.json
cp input/vocabulary/codesystem/codesystem-condition-clinical.json bundlegen/sourcefiles/codesystem-condition-clinical.json
cp input/vocabulary/codesystem/codesystem-medication-request-category.json bundlegen/sourcefiles/codesystem-medication-request-category.json
cp input/vocabulary/codesystem/codesystem-medication-request-status.json bundlegen/sourcefiles/codesystem-medication-request-status.json
cp input/vocabulary/codesystem/codesystem-uscore-condition-category.json bundlegen/sourcefiles/codesystem-uscore-condition-category.json
cp input/vocabulary/valueset/valueset-condition-clinical-status-active bunlegen/sourcefiles/valueset-condition-clinical-status-active
cp input/vocabulary/valueset/valueset-medicationrequest-category-community bunlegen/sourcefiles/valueset-medicationrequest-category-community
cp input/vocabulary/valueset/valueset-medicationrequest-status-active bunlegen/sourcefiles/valueset-medicationrequest-status-active
cp input/vocabulary/valueset/valueset-condition-encounter-diagnosis-category bunlegen/sourcefiles/valueset-condition-encounter-diagnosis-category
cp input/vocabulary/valueset/valueset-condition-problem-list-category bunlegen/sourcefiles/valueset-condition-problem-list-category
cp input/vocabulary/valueset/valueset-condition-us-core-health-concern-category bunlegen/sourcefiles/valueset-condition-us-core-health-concern-category
cp input/vocabulary/valueset/valueset-observation-category-laboratory bunlegen/sourcefiles/valueset-observation-category-laboratory
cp input/vocabulary/valueset/valueset-observation-category-procedure bunlegen/sourcefiles/valueset-observation-category-procedure

cp input/vocabulary/valueset/valueset-buprenorphine-and-methadone-medications.json bundlegen/sourcefiles/valueset-buprenorphine-and-methadone-medications.json
cp input/vocabulary/valueset/valueset-cdc-malignant-cancer-conditions.json bundlegen/sourcefiles/valueset-cdc-malignant-cancer-conditions.json
cp input/vocabulary/valueset/valueset-conditions-likely-terminal-for-opioid-prescribing.json bundlegen/sourcefiles/valueset-conditions-likely-terminal-for-opioid-prescribing.json
cp input/vocabulary/valueset/valueSet-extended-release-opioid-with-ambulatory-misuse-potential.json bundlegen/sourcefiles/valueSet-extended-release-opioid-with-ambulatory-misuse-potential.json
cp input/vocabulary/valueset/valueSet-hospice-disposition.json bundlegen/sourcefiles/valueSet-hospice-disposition.json
cp input/vocabulary/valueset/valueset-hospice-finding.json bundlegen/sourcefiles/valueset-hospice-findinge.json
cp input/vocabulary/valueset/valueset-hospice-procedure.json bundlegen/sourcefiles/valueset-hospice-procedure.json
cp input/vocabulary/valueset/valueset-limited-life-expectancy-conditions.json bundlegen/sourcefiles/valueset-limited-life-expectancy-conditions.json
cp input/vocabulary/valueset/valueset-naloxone-medications.json bundlegen/sourcefiles/valueset-naloxone-medications.json
cp input/vocabulary/valueset/valueset-benzodiazepine-medications.json bundlegen/sourcefiles/valueset-benzodiazepine-medications.json
cp input/vocabulary/valueset/valueset-non-opioid-drug-urine-screening.json bundlegen/sourcefiles/valueset-non-opioid-drug-urine-screening.json
cp input/vocabulary/valueset/valueset-office-visit.json bundlegen/sourcefiles/valueset-office-visit.json
cp input/vocabulary/valueset/valueset-oncology-specialty-designations.json bundlegen/sourcefiles/valueset-oncology-specialty-designations.json
cp input/vocabulary/valueset/valueset-opioid-analgesics-with-ambulatory-misuse-potential.json bundlegen/sourcefiles/valueset-opioid-analgesics-with-ambulatory-misuse-potential.json
cp input/vocabulary/valueset/valueset-opioid-counseling-procedure.json bundlegen/sourcefiles/valueset-opioid-counseling-procedure.json
cp input/vocabulary/valueset/valueset-opioid-drug-urine-screening.json bundlegen/sourcefiles/valueset-opioid-drug-urine-screening.json
cp input/vocabulary/valueset/valueset-opioid-misuse-assessment-procedure.json bundlegen/sourcefiles/valueset-opioid-misuse-assessment-procedures.json
cp input/vocabulary/valueset/valueset-opioid-misuse-disorders.json bundlegen/sourcefiles/valueset-opioid-misuse-disorders.json
cp input/vocabulary/valueset/valueset-pain-management-procedure.json bundlegen/sourcefiles/valueset-pain-management-procedure.json
cp input/vocabulary/valueset/valueset-pain-treatment-plan.json bundlegen/sourcefiles/valueset-pain-treatment-plan.json
cp input/vocabulary/valueset/valueset-pdmp-data-reviewed-finding.json bundlegen/sourcefiles/valueset-pdmp-data-reviewed-findings.json
cp input/vocabulary/valueset/valueset-pdmp-review-procedure.json bundlegen/sourcefiles/valueset-pdmp-review-procedure.json
cp input/vocabulary/valueset/valueset-substance-misuse-behavioral-counseling.json bundlegen/sourcefiles/valueset-substance-misuse-behavioral-counseling.json
cp input/vocabulary/valueset/valueset-therapies-indicating-end-of-life-care.json bundlegen/sourcefiles/valueset-therapies-indicating-end-of-life-care.json
cp input/vocabulary/valueset/valueset-urine-drug-screening-tests.json bundlegen/sourcefiles/valueset-urine-drug-screening-tests.json

#cd /bundlegen
for entry in "bundlegen/sourcefiles"/*
do
  echo bundling "$entry"
done

# Bundle all resources from bundlegen/sourcefiles
sh bundlegen/_bundle.sh "opioid-cds-terminology"

rm bundles/opioid-cds-terminology-bundle.json
cp bundlegen/opioid-cds-terminology-bundle.json bundles/opioid-cds-terminology-bundle.json
echo 'Copied generated bundle to bundles/opioid-cds-terminology-bundle.json'

echo 'Cleaning up bundlegen/sourcefiles...'
rm bundlegen/opioid-cds-terminology-bundle.json
rm bundlegen/sourcefiles/*

echo 'terminology bundle refresh complete.'
