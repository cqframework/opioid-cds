@ECHO OFF
DEL /F /Q .\bundlegen\bundlegen-bundle.json
DEL /F /Q .\bundlegen\sourcefiles\*

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

for %%y in (.\bundlegen\sourcefiles\*) Do @echo bundling %%y

cmd /c .\bundlegen\_bundle.bat

echo 'quick start terminology bundle refresh complete.'
