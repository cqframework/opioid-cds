#!/bin/bash
publisher_jar=org.hl7.fhir.publisher.jar
input_cache_path=./input-cache/
set -e
echo Checking internet connection...
wget -q --spider tx.fhir.org

if [ $? -eq 0 ]; then
	echo "Online"
	txoption=""
else
	echo "Offline"
	txoption="-tx n/a"
fi

echo "$txoption"

publisher=$input_cache_path/$publisher_jar
if test -f "$publisher"; then
	JAVA -jar $publisher -ig ig.ini $txoption $* -version STU3

else
	publisher=../$publisher_jar
	echo $publisher
	if test -f "$publisher"; then
		JAVA -jar $publisher -ig ig.ini $txoption $* -version STU3
	else
		echo IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
	fi
fi
