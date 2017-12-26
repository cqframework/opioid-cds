# opioid-cds
Opioid Prescribing Support Implementation Guide (FHIR STU3 (3.0.1))

This project provides the source for the Opioid Prescribing Support Implementation Guide.

Commits to this repository will automatically trigger a new build of the IG, which will then be published to the following location:

[http://build.fhir.org/ig/cqframework/opioid-cds/](http://build.fhir.org/ig/cqframework/opioid-cds/)

Build log is available here:

[http://build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/cqframework/opioid-cds](http://build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/cqframework/opioid-cds)

Debugging information is available here:

[http://build.fhir.org/ig/cqframework/opioid-cds/debug.tgz](http://build.fhir.org/ig/cqframework/opioid-cds/debug.tgz)

## Local Build

The HL7 IG Publisher is committed to this repository to make building as easy as possible. To build locally, clone the repository and issue the following command in the root:

    java -jar "org.hl7.fhir.igpublisher.jar" -ig ig.json