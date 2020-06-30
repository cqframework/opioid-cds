#!/bin/bash
#DO NOT EDIT WITH WINDOWS
tooling_jar=tooling-1.1.0-SNAPSHOT-jar-with-dependencies.jar
input_cache_path=./input-cache
bundlegen_path=$PWD/bundlegen
sourcefiles_path=$bundlegen_path/sourcefiles

set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	fsoption=""
#"-fs http://cqm-sandbox.alphora.com/cqf-ruler-r4/fhir/"
else
	echo "Offline"
	fsoption=""
fi

echo "$fsoption"

tooling=$input_cache_path/$tooling_jar
if test -f "$tooling"; then
	JAVA -jar $tooling -BundleResources -ptd=$sourcefiles_path op=$bundlegen_path -v=stu3 -e=json
else
	tooling=../$tooling_jar
	echo $tooling
	if test -f "$tooling"; then
		JAVA -jar $tooling -BundleResources -ptd=$sourcefiles_path op=$bundlegen_path -v=stu3 -e=json
	else
		echo IG Refresh NOT FOUND in input-cache or parent folder.  Please run _updateCQFTooling.  Aborting...
	fi
fi
