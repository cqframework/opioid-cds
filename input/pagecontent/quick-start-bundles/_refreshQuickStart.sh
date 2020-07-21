#!/bin/bash
rm bundlegen/bundlegen-bundle.json
rm bundlegen/sourcefiles/*

cp input/resources/plandefinition/plandefinition-OpioidCDSREC10PatientView.json bundlegen/sourcefiles/
cp input/resources/plandefinition/plandefinition-OpioidCDSREC11PatientView.json bundlegen/sourcefiles/
cp input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/
cp input/resources/library/OMTKData2019.json bundlegen/sourcefiles/
cp input/resources/library/OMTKLogicCQL.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSCommon.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSCommonConfig.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSRoutines.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSREC10PatientView.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSREC11PatientView.json bundlegen/sourcefiles/
cp input/pagecontent/quick-start-bundles/rec10-medication-1.json bundlegen/sourcefiles/
cp input/pagecontent/quick-start-bundles/rec10-medication-2.json bundlegen/sourcefiles/

#cd /bundlegen
for entry in "bundlegen/sourcefiles"/*
do
  echo bundling "$entry"
done

# Bundle all resources from bundlegen/sourcefiles
sh bundlegen/_bundle.sh

rm input/pagecontent/quick-start-bundles/opioid-cds-content-bundle.json
cp bundlegen/bundlegen-bundle.json input/pagecontent/quick-start-bundles/opioid-cds-content-bundle.json
echo 'Copied generated bundle to input/pagecontent/quick-start-bundles/opioid-cds-content-bundle.json'

echo 'Cleaning up bundlegen/sourcefiles...'
rm bundlegen/bundlegen-bundle.json
rm bundlegen/sourcefiles/*

echo 'quick start content bundle refresh complete.'

# refreshing Terminology bundles
echo refreshing terminology bundle...

cp input/vocabulary/valueset/valueset-benzodiazepine-medications.json bundlegen/sourcefiles/valueset-benzodiazepine-medications.json
cp input/vocabulary/valueset/valueset-buprenorphine-and-methadone-medications.json bundlegen/sourcefiles/valueset-buprenorphine-and-methadone-medications.json
cp input/vocabulary/valueset/valueset-cdc-malignant-cancer-conditions-enum.json bundlegen/sourcefiles/valueset-cdc-malignant-cancer-conditions-enum.json
cp input/vocabulary/valueset/valueset-conditions-likely-terminal-for-opioid-prescribing-enum.json bundlegen/sourcefiles/valueset-conditions-likely-terminal-for-opioid-prescribing-enum.json
cp input/vocabulary/valueset/valueset-conditions-documenting-substance-misuse.json bundlegen/sourcefiles/valueset-conditions-documenting-substance-misuse.json
cp input/vocabulary/valueset/valueset-discharge-to-hospice.json bundlegen/sourcefiles/valueset-discharge-to-hospice.json
cp input/vocabulary/valueset/valueset-end-of-life-care.json bundlegen/sourcefiles/valueset-end-of-life-care.json
cp input/vocabulary/valueset/valueset-end-of-life-conditions.json bundlegen/sourcefiles/valueset-end-of-life-conditions.json
cp input/vocabulary/valueset/valueset-extended-release-opioids-with-ambulatory-misuse-potential.json bundlegen/sourcefiles/valueset-extended-release-opioids-with-ambulatory-misuse-potential.json
cp input/vocabulary/valueset/valueset-hospice-disposition.xml bundlegen/sourcefiles/valueset-hospice-disposition.xml
cp input/vocabulary/valueset/valueset-hospice-finding.json bundlegen/sourcefiles/valueset-hospice-finding.json
cp input/vocabulary/valueset/valueset-hospice-procedure.json bundlegen/sourcefiles/valueset-hospice-procedure.json
cp input/vocabulary/valueset/valueset-limited-life-expectancy-conditions-enum.json bundlegen/sourcefiles/valueset-limited-life-expectancy-conditions-enum.json
cp input/vocabulary/valueset/valueset-limited-life-expectancy-conditions.json bundlegen/sourcefiles/valueset-limited-life-expectancy-conditions.json
cp input/vocabulary/valueset/valueset-long-acting-opioids.json bundlegen/sourcefiles/valueset-long-acting-opioids.json
cp input/vocabulary/valueset/valueset-metastatic-cancer.json bundlegen/sourcefiles/valueset-metastatic-cancer.json
cp input/vocabulary/valueset/valueset-naloxone-medications.json bundlegen/sourcefiles/valueset-naloxone-medications.json
cp input/vocabulary/valueset/valueset-naloxone.json bundlegen/sourcefiles/valueset-naloxone.json
cp input/vocabulary/valueset/valueset-non-opioid-illicit-drug-urine-screening.json bundlegen/sourcefiles/valueset-non-opioid-illicit-drug-urine-screening.json
cp input/vocabulary/valueset/valueset-office-visit.json bundlegen/sourcefiles/valueset-office-visit.json
cp input/vocabulary/valueset/valueset-oncology-specialty-designations-enum.json bundlegen/sourcefiles/valueset-oncology-specialty-designations-enum.json
cp input/vocabulary/valueset/valueset-opioid-abuse-assessment.json bundlegen/sourcefiles/valueset-opioid-abuse-assessment.json
cp input/vocabulary/valueset/valueset-opioid-analgesics-with-ambulatory-misuse-potential.json bundlegen/sourcefiles/valueset-opioid-analgesics-with-ambulatory-misuse-potential.json
cp input/vocabulary/valueset/valueset-opioid-counseling-procedure.json bundlegen/sourcefiles/valueset-opioid-counseling-procedure.json
cp input/vocabulary/valueset/valueset-opioid-drug-urine-screening.json bundlegen/sourcefiles/valueset-opioid-drug-urine-screening.json
cp input/vocabulary/valueset/valueset-opioid-misuse-assessment-procedure.json bundlegen/sourcefiles/valueset-opioid-misuse-assessment-procedure.json
cp input/vocabulary/valueset/valueset-opioid-misuse-disorders-enum.json bundlegen/sourcefiles/valueset-opioid-misuse-disorders-enum.json
cp input/vocabulary/valueset/valueset-opioidcds-indicator.json bundlegen/sourcefiles/valueset-opioidcds-indicator.json
cp input/vocabulary/valueset/valueset-opioids-abused-in-ambulatory-care.json bundlegen/sourcefiles/valueset-opioids-abused-in-ambulatory-care.json
cp input/vocabulary/valueset/valueset-opioids.json bundlegen/sourcefiles/valueset-opioids.json
cp input/vocabulary/valueset/valueset-pain-management-procedure.json bundlegen/sourcefiles/valueset-pain-management-procedure.json
cp input/vocabulary/valueset/valueset-pain-treatment-plan.json bundlegen/sourcefiles/valueset-pain-treatment-plan.json
cp input/vocabulary/valueset/valueset-pdmp-data-reviewed-finding.json bundlegen/sourcefiles/valueset-pdmp-data-reviewed-finding.json
cp input/vocabulary/valueset/valueset-pdmp-review-procedure.json bundlegen/sourcefiles/valueset-pdmp-review-procedure.json
cp input/vocabulary/valueset/valueset-short-acting-opioids.json bundlegen/sourcefiles/valueset-short-acting-opioids.json
cp input/vocabulary/valueset/valueset-substance-abuse.json bundlegen/sourcefiles/valueset-substance-abuse.json
cp input/vocabulary/valueset/valueset-substance-misuse-behavioral-counseling-enum.json bundlegen/sourcefiles/valueset-substance-misuse-behavioral-counseling-enum.json
cp input/vocabulary/valueset/valueset-therapies-indicating-end-of-life-care-enum.json bundlegen/sourcefiles/valueset-therapies-indicating-end-of-life-care-enum.json

#cd /bundlegen
for entry in "bundlegen/sourcefiles"/*
do
  echo bundling "$entry"
done

# Bundle all resources from bundlegen/sourcefiles
sh bundlegen/_bundle.sh

rm input/pagecontent/quick-start-bundles/opioid-cds-terminology-bundle.json
cp bundlegen/bundlegen-bundle.json input/pagecontent/quick-start-bundles/opioid-cds-terminology-bundle.json
echo 'Copied generated bundle to input/pagecontent/quick-start-bundles/opioid-cds-terminology-bundle.json'

echo 'Cleaning up bundlegen/sourcefiles...'
rm bundlegen/bundlegen-bundle.json
rm bundlegen/sourcefiles/*

echo 'quick start terminology bundle refresh complete.'
