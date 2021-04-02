@ECHO OFF

DEL /F /Q bundlegen\bundlegen-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

if not exist bundlegen\sourcefiles mkdir bundlegen\sourcefiles

COPY .\input\resources\activitydefinition\activitydefinition-opioidcds-urine-screening-request.json bundlegen\sourcefiles\
COPY .\input\resources\plandefinition\plandefinition-OpioidCDSREC10PatientView.json bundlegen\sourcefiles\
COPY .\input\resources\library\FHIRHelpers.json bundlegen\sourcefiles\
COPY .\input\resources\library\OMTKData2019.json bundlegen\sourcefiles\
COPY .\input\resources\library\OMTKLogicCQL.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSCommon.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSCommonConfig.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSRoutines.json bundlegen\sourcefiles\
COPY .\input\resources\library\OpioidCDSREC10PatientView.json bundlegen\sourcefiles\
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
