#!/bin/bash
rm bundlegen/bundlegen-bundle.json
rm bundlegen/sourcefiles/*

mkdir -p bundlegen/sourcefiles

cp input/resources/activitydefinition/activitydefinition-opioidcds-urine-screening-request.json bundlegen/sourcefiles/
cp input/resources/plandefinition/plandefinition-OpioidCDSREC10PatientView.json bundlegen/sourcefiles/
cp input/resources/library/FHIRHelpers.json bundlegen/sourcefiles/
cp input/resources/library/OMTKData2019.json bundlegen/sourcefiles/
cp input/resources/library/OMTKLogicCQL.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSCommon.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSCommonConfig.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSRoutines.json bundlegen/sourcefiles/
cp input/resources/library/OpioidCDSREC10PatientView.json bundlegen/sourcefiles/
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
