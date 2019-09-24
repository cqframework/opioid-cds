# Opioid Prescribing Support Implementation Guide (FHIR STU3 (3.0.1))

This project is a joint effort by the Centers for Disease Control and Prevention (CDC) and the Office of the National Coordinator for Health IT (ONC) focused on improving processes for the development of standardized, shareable, computable decision support artifacts using the [CDC Opioid Prescribing Guideline](https://www.cdc.gov/mmwr/volumes/65/rr/rr6501e1.htm) as a model case.

The current draft of the implementation guide is available [here](http://build.fhir.org/ig/cqframework/opioid-cds/). The draft is in the final stages of cleanup before publishing the initial 1.0 release.

The guide is published under a Creative Commons [license](LICENSE.md).

## Change Management and Roadmap

The guide currently includes artifacts to support 6 of the 12 recommendations contained in the Opioid Guideline. Next steps for this project include additional testing and piloting of the existing artifacts, as well as potential development of additional recommendations.

Feedback and issues can be submitted via the [issues](issues) page, and will be incorporated into subsequent releases as time and resources allow.

## Repository and Build Information

This repository contains the source for the Opioid Prescribing Support Implementation Guide, and uses the [FHIR Implementation Guide publisher](http://wiki.hl7.org/index.php?title=IG_Publisher_Documentation) to produce a FHIR Implementation Guide.

Commits to this repository will automatically trigger a new build of the IG, which will then be published to the following location:

[http://build.fhir.org/ig/cqframework/opioid-cds/](http://build.fhir.org/ig/cqframework/opioid-cds/)

Build log is available here:

[http://build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/cqframework/opioid-cds](http://build.fhir.org.s3-website-us-east-1.amazonaws.com/logs/cqframework/opioid-cds)

Debugging information is available here:

[http://build.fhir.org/ig/cqframework/opioid-cds/debug.tgz](http://build.fhir.org/ig/cqframework/opioid-cds/debug.tgz)

### Local Build

The HL7 IG Publisher is committed to this repository to make building as easy as possible. To build locally, clone the repository and issue the following command in the root:

    java -jar "org.hl7.fhir.publisher.jar" -ig ig.json
