@ECHO OFF

DEL /F /Q bundlegen\quickstart-medications-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

if not exist bundlegen\sourcefiles mkdir bundlegen\sourcefiles

COPY .\input\pagecontent\quick-start-bundles\rec10-medication-1.json bundlegen\sourcefiles\
COPY .\input\pagecontent\quick-start-bundles\rec10-medication-2.json bundlegen\sourcefiles\

for %%e in (bundlegen\sourcefiles\*) Do @echo bundling %%e

cmd /c bundlegen\_bundle.bat quickstart-medications

DEL /F /Q input\pagecontent\quick-start-bundles\quickstart-medications-bundle.json
COPY bundlegen\quickstart-medications-bundle.json input\pagecontent\quick-start-bundles\quickstart-medications-bundle.json
echo 'Copied generated bundle to input\pagecontent\quick-start-bundles\quickstart-medications-bundle.json'

echo 'Cleaning up bundlegen/sourcefiles...'
DEL /F /Q bundlegen\quickstart-medications-bundle.json
DEL /F /Q bundlegen\sourcefiles\*

echo 'quick start bundle refresh complete.'
