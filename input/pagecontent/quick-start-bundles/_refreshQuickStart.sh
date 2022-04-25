#!/bin/bash
rm bundlegen/quickstart-medications-bundle.json
rm bundlegen/sourcefiles/*

mkdir -p bundlegen/sourcefiles

cp input/pagecontent/quick-start-bundles/rec10-medication-1.json bundlegen/sourcefiles/
cp input/pagecontent/quick-start-bundles/rec10-medication-2.json bundlegen/sourcefiles/

#cd /bundlegen
for entry in "bundlegen/sourcefiles"/*
do
  echo bundling "$entry"
done

# Bundle all resources from bundlegen/sourcefiles
sh bundlegen/_bundle.sh quickstart-medications

rm input/pagecontent/quick-start-bundles/quickstart-medications-bundle.json
cp bundlegen/quickstart-medications-bundle.json input/pagecontent/quick-start-bundles/quickstart-medications-bundle.json
echo 'Copied generated bundle to input/pagecontent/quick-start-bundles/quickstart-medications-bundle.json'

echo 'Cleaning up bundlegen/sourcefiles...'
rm bundlegen/quickstart-medications-bundle.json
rm bundlegen/sourcefiles/*

echo 'quick start bundle refresh complete.'
