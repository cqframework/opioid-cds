[33mcommit bf158c4a087305d95a70c64ddcdfdae2ce2da03a[m[33m ([m[1;36mHEAD -> [m[1;32mdevelop[m[33m)[m
Author: bryantaustin13 <bryant@alphora.com>
Date:   Tue Jan 26 11:44:23 2021 -0700

    updated tooling to version 1.3.1

[33mcommit e09cec359958d1c082823d1f379d44fe8a4a4b0e[m[33m ([m[1;31morigin/develop[m[33m)[m
Merge: 2a5c1fa 7a20e26
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Thu Aug 27 14:58:22 2020 -0600

    Merge pull request #164 from cqframework/issue_163_naive_assets_v32
    
    Issue 163 opioid naive assets v32

[33mcommit 7a20e26eedb5e4d6c677b432b3e253ffb802c8aa[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Aug 27 14:38:48 2020 -0600

    Issue #163 - Updated Opioid Naive diagram and definitions table

[33mcommit 2a5c1faee2aa4d53aff2f18bd57173a23bb81792[m
Merge: aab4324 27dc09b
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Aug 18 12:17:40 2020 -0600

    Merge pull request #162 from cqframework/medicationstatement_retrieve_refactor
    
    Medicationstatement retrieve refactor

[33mcommit 27dc09ba8229d6faca76f6349352c901775a40c8[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Aug 18 11:09:12 2020 -0600

    Update recs-04pv-10pv-11pv-12-content-bundle.json

[33mcommit ff96d1e4f958ed446cb02db20a843234de081df7[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Aug 18 11:07:45 2020 -0600

    Modified MedicationStatement retrieve to account for both codeableConcept and reference.

[33mcommit aab4324d4eb82403ef827c41836332180259bc86[m
Merge: 4a3133c 1ae8338
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Aug 18 11:00:51 2020 -0600

    Merge pull request #161 from cqframework/issue_135_continued
    
    Removed where restrictions on Condition.category that were no longer …

[33mcommit 1ae83386a08f20751a21902bcb3166077639b20f[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Aug 17 15:53:41 2020 -0600

    Removed where restrictions on Condition.category that were no longer needed after introducing base Condition retrieve that is union of three categories.

[33mcommit 4a3133c4ad952683bd4b8b6d125ca2ed1b0cf056[m
Merge: e25b0d7 43da504
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Aug 17 14:55:53 2020 -0600

    Merge pull request #160 from cqframework/issue_158_continued
    
    Removed unnecessary flatten calls around calls to GetMedicationNames

[33mcommit 43da504dcdfcfd53d4dcd49f5e61fcbd2feeba43[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Aug 17 14:48:58 2020 -0600

    Removed unnecessary flatten calls around calls to GetMedicationNames

[33mcommit e25b0d733832086ceb314473aae228fa72598d42[m
Merge: 2cc0247 83fe425
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Mon Aug 17 13:26:38 2020 -0600

    Merge pull request #159 from cqframework/fix-158-getmedicationnames-correction
    
    #158: Fixed an issue with GetMedicationNames incorrectly assuming sin…

[33mcommit 83fe425925346a4e484b5da244baf5b72817438c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Aug 17 13:25:20 2020 -0600

    Removed unnecessary flatten call in Rec04 Get Detail; refreshed

[33mcommit 1092c5bd2e5943bfd3d7b627502c1457957370c2[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Aug 17 12:53:45 2020 -0600

    #158: Fixed an issue with GetMedicationNames incorrectly assuming singleton RxNorm codes on MedicationRequest resources.

[33mcommit 2cc0247dcb296f1f89348a0be4a432a353db6fe2[m
Merge: 0bd5c57 1a1342c
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Wed Aug 12 10:03:46 2020 -0600

    Merge pull request #156 from cqframework/naive_imgChange
    
    updated opioid naive imgs

[33mcommit 0bd5c573bb225341632333b382c9beb5e1238e9c[m
Merge: e5e98bd cfd121b
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu Aug 6 14:54:25 2020 -0600

    Merge pull request #157 from cqframework/condition_category_union
    
    Hospice Disposition lookback period; Condition.category query

[33mcommit cfd121bf7fe0dcdc2c9f4a3d849ee03b159bc161[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Aug 6 14:28:39 2020 -0600

    Hospice Disposition lookback period; Condition.category query

[33mcommit 1a1342cf2a60b5539e64a36ce054586688b570a0[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Aug 3 15:36:06 2020 -0600

    updated opioid naive imgs

[33mcommit e5e98bd5daf4ecfe14c7aef899bcc902cf77322d[m
Merge: 2009db1 bba134f
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Fri Jul 31 13:21:10 2020 -0600

    Merge pull request #154 from cqframework/disable_hospice_findings_exclusion
    
    Added config point for Hospice Findings exclusion.

[33mcommit bba134fcf2ac26e3bacfc3317258f5d82d57ed01[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Jul 31 13:16:09 2020 -0600

    Reverted Category retrieve filter.

[33mcommit 9148d3d5c60d4c5d25dd9282e1529182003400bd[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Jul 31 12:39:06 2020 -0600

    Added config point for Hospice Findings exclusion.

[33mcommit 2009db1976c981de0ca6cad2069d2c97cfea8213[m
Merge: 83d8a5e 62ce450
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Fri Jul 31 08:29:09 2020 -0600

    Merge pull request #153 from cqframework/disable_medicationdispense
    
    Disable medicationdispense check in Opioid Naive

[33mcommit 62ce4504958984d382cb85f61d1a232df9fa9033[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 30 16:14:22 2020 -0600

    refresh

[33mcommit 01cd8c66533393450af0e31d6afc1145dd6c225d[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 30 16:12:02 2020 -0600

    Turned off check of MedicationDispense for Opioid Naive

[33mcommit 83d8a5edc07f20ab36af1b3e58145d6c9a235bc4[m
Merge: 562558f 67a8a5f
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Wed Jul 29 13:58:25 2020 -0600

    Merge pull request #152 from cqframework/issue_151_oid_codesystem_support
    
    Issue_151 - Added OID CodeSystem variation for Condition codes

[33mcommit 67a8a5fffc2448d32979834c634c2b2a91bd86b1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 29 12:57:06 2020 -0600

    Added OID CodeSystem variation for Condition codes

[33mcommit 562558fb0ccaa091d2f4c99af1300365c27bb7da[m
Merge: 2db2dce e62fcf0
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jul 28 16:23:40 2020 -0600

    Merge pull request #150 from cqframework/issue_149_practitionerrole_specialty_knob
    
    Added configuration point for Active Cancer Treatment PractitionerRol…

[33mcommit e62fcf0f154fb107eb9efd639ac4e3b8f48f05f1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 28 15:45:51 2020 -0600

    Updated to use if...else

[33mcommit 2cacbd522a7f2393ca2474357c066d23ea86aa8c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 28 14:32:02 2020 -0600

    Added configuration point for Active Cancer Treatment PractitionerRole specialty check.

[33mcommit 2db2dceca1aae168cf0f3fb1d4a77395af6210ef[m
Merge: 1fbcd72 c70ff38
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jul 28 09:17:32 2020 -0600

    Merge pull request #148 from cqframework/practitionerrole_specialty_retrieve
    
    PractitionerRole - retrieve, filter on specialty

[33mcommit c70ff38ffbc975cc8f537dd24ee4b743fe5c343e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 28 08:52:53 2020 -0600

    Modified PractitionerRole retrieve to filter on specialty

[33mcommit 1fbcd726b26037fdcdd59bd3863c50e9d3ca8971[m
Merge: b0d95fa 3b87717
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jul 28 07:32:49 2020 -0600

    Merge pull request #147 from cqframework/condition_category_system
    
    Fixed US Core Condition Category VS Code System reference

[33mcommit 3b877173a57e9ecf1ab598bfbfdd73e98316c011[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 28 07:11:46 2020 -0600

    Updated condition-category code system URL

[33mcommit a9bea3238b3b491903539af640f861cc09cd239c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 27 16:34:53 2020 -0600

    Fixed US Core Condition Category VS Code System reference

[33mcommit b0d95fae252e88a86c2438bbc409e398e927d0e0[m
Merge: c0fe135 e894b49
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Tue Jul 21 22:16:50 2020 -0600

    Merge pull request #144 from cqframework/condition_category_valueset_fix
    
    Condition category valueset fix

[33mcommit e894b49e7a49fce7d2f0525ab791d8e6e2d2dd49[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 20:51:45 2020 -0600

    Fixing broken links and library titles

[33mcommit 78fd9d6141e58af8830e011d342c69dccf9551f9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 20:04:39 2020 -0600

    refresh

[33mcommit 516f7fb23e5c9cbc35193286c0f9a7d0a9edbb54[m
Merge: 106f0fe c0fe135
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 20:03:03 2020 -0600

    Merge branch 'develop' into condition_category_valueset_fix

[33mcommit c0fe135ca18c483465c2ba3a339c1b2ec86ac1ba[m
Merge: 85cfcca 8e230dc
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Tue Jul 21 20:01:08 2020 -0600

    Merge pull request #143 from cqframework/issue_141_b_opioid_naive
    
    Modified routines "Prescription/Dispense Inclusion Period" to be 90 d…

[33mcommit 106f0fe038c08ef5a5d2384b2caeabff396dadbe[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 19:58:29 2020 -0600

    Update recs-04pv-10pv-11pv-12-content-bundle.json

[33mcommit 154e863ae7bd9cebf1e1284cc0470cff18cdff71[m
Merge: 9f073f3 85cfcca
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 19:58:18 2020 -0600

    Merge branch 'develop' into condition_category_valueset_fix

[33mcommit 8e230dcc0f91324892cb5853f9bed33980d4fb6f[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 17:35:37 2020 -0600

    Modified routines "Prescription/Dispense Inclusion Period" to be 90 days - consistent with other lookback periods

[33mcommit 85cfcca4db279c3694f8a6a25616ef967b26f8ba[m
Merge: b029494 05e4387
Author: JPercival <JPercival@users.noreply.github.com>
Date:   Tue Jul 21 17:03:58 2020 -0600

    Merge pull request #142 from cqframework/issue_141_opioid_naive_24_hour_exclusion
    
    Issue #141 opioid naive 24 hour exclusion

[33mcommit 9f073f30ec03f794cf78a7c26f596c8343b3fa29[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 16:46:55 2020 -0600

    Explicit compose in us-core-condition-category vs; Condition retrieves - moved category filter to cql

[33mcommit 05e43870deee04d1df648ae8e153335e949a458f[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 15:48:16 2020 -0600

    txcache update

[33mcommit feb2196f86111d53f244842b2eb96a46f302c593[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 15:44:28 2020 -0600

    Modified Opioid Naive to exclude data from previous 24 hours

[33mcommit b029494bb63572ba6603585b6fd3a03733c46a6a[m
Merge: ff731a3 aa599b7
Author: JPercival <JPercival@users.noreply.github.com>
Date:   Tue Jul 21 07:45:08 2020 -0600

    Merge pull request #140 from cqframework/us_core_condition_category_vs
    
    Added us-core-condition-category valueset to terminology bundle

[33mcommit aa599b747ef39407058967a9e7587e0aef3d9c6f[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 21 07:33:21 2020 -0600

    Added us-core-condition-category valueset to terminology bundle

[33mcommit ff731a3c6c89f39b9c78eecbda66887b670afe40[m
Merge: 0e7d7d5 d4174c1
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Mon Jul 20 19:56:58 2020 -0600

    Merge pull request #139 from cqframework/rec_accordions
    
    Various content updates

[33mcommit d4174c17cc38e9b58f6a00699d13d21f8a5669b5[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 20 19:55:33 2020 -0600

    Refresh

[33mcommit 80f4fd668765938289fbc0b6b116af0a564eca4d[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 20 17:50:22 2020 -0600

    Removed bad '--> '

[33mcommit 0301c1b96acfbbb04814652111550c3b7843309f[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 20 17:39:02 2020 -0600

    Updated publisher script; removed "library-" prefix from libraries; refreshed

[33mcommit efb5bf8f76bddaaa0a93ef7ef56e4c4e3fd59762[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 20 16:46:15 2020 -0600

    Refreshed

[33mcommit 1a88f5c2cacbf19a7396c94a8446cc2330687a3c[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jul 20 16:28:34 2020 -0600

    fixed rec4 bundle names

[33mcommit ba97f9e23be2ef49da05e8801d18c0c409237c75[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 20 16:22:34 2020 -0600

    Removed extra '-->' in Rec04 page; Fixed header in Rec04 page Example Requests

[33mcommit 1c2e7dffe91f202039b9e55212223967c0b1f6a8[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jul 20 15:58:31 2020 -0600

    rec 4 patient view hook in example/data requests

[33mcommit 72a4c32a6ed2a4976e77936595ae964d82406c84[m
Merge: fe5ac15 1983f06
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jul 20 11:32:44 2020 -0600

    Merge branch 'rec_accordions' of https://github.com/cqframework/opioid-cds into rec_accordions

[33mcommit fe5ac15bbcb55d042534443d44cde2528a25c211[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jul 20 11:32:26 2020 -0600

    fixing casing errors in recs 5,7,8,10,11 and intergration

[33mcommit 1983f06a260810e0300401cf5dd9f9f7664c9de1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 20 11:08:38 2020 -0600

    Removed unused "Encounter Period" from Rec04 CQL

[33mcommit 4536e71eff0d2361dbe49c0fd19ca9254597db02[m
Merge: 9320979 16c6f4f
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jul 20 10:43:19 2020 -0600

    Merge branch 'rec_accordions' of https://github.com/cqframework/opioid-cds into rec_accordions

[33mcommit 9320979a05346f24215ed1f10016894213dcf78d[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jul 20 10:42:56 2020 -0600

     working links in reach rec w/data and example content

[33mcommit 16c6f4f28bbbfb14e65060bef331cae1d6ec0911[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 16 19:41:41 2020 -0600

    Added chronic pain page to fix broken link.

[33mcommit b97b3442ea8da6dfde11872976cd9fe2adce02af[m
Merge: a2e4010 5f6dca7
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 16 17:01:33 2020 -0600

    Merge branch 'rec_accordions' of https://github.com/cqframework/opioid-cds into rec_accordions

[33mcommit a2e4010b9a381363421e4aa733af0214c1863d14[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 16 17:01:31 2020 -0600

    Fixed missing footer on new rec pages; fixed CDC link in footer.

[33mcommit 5f6dca7ce611ea8f690aa06685ca8cb4881c922c[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Thu Jul 16 15:47:05 2020 -0600

    added missing recs example requests and fixed to meet stu3 standards

[33mcommit 8b58e33c8055af65b4e91c82fec53ce5de379591[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Thu Jul 16 15:05:44 2020 -0600

    corrected some request examples to match stu3 requirements

[33mcommit f8dbc38066ad2a7c2c226ada8f9ee9c26c9707ec[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 16 14:47:34 2020 -0600

    Update plandef and library links; added subroutines snippet/include

[33mcommit 9d61de6db9ce18c51aeed40b8b934d8f7a3bd3a6[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jul 16 13:48:31 2020 -0600

    Added routines library to rec pages; removed common snippets; registered new recs.

[33mcommit afe3f0671cb724187e078e13952ddbc4ff611679[m
Merge: 27a5c4d 257a0b8
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 21:43:43 2020 -0600

    Merge branch 'procedurerequest_workaround' into rec_accordions

[33mcommit 257a0b8ab7d49e44044f656ad451b985c3a0621b[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 21:28:44 2020 -0600

    temp removal of Routines MedicationStatement datareq

[33mcommit a97e630d2bdef3ad105acf47aeb3c35511201030[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 21:22:32 2020 -0600

    Temp removal of Routines procedurerequest datareq as workaround.

[33mcommit 27a5c4d0ca0570fe97bc8a5dbb8ad06926cfb6a3[m
Merge: 99f804a 0e7d7d5
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 15:52:44 2020 -0600

    Merge branch 'develop' into rec_accordions

[33mcommit 0e7d7d5fe7fe99b40ac940033dfe102942751ca0[m
Merge: 025244e 4a0583e
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Wed Jul 15 15:50:40 2020 -0600

    Merge pull request #138 from cqframework/fhiralltypes_procedurerequest
    
    Start of registering Routines library; fixed rec12 reference

[33mcommit 99f804a71cb564185ffec8c6ba3114d8dbef7e84[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 15:45:38 2020 -0600

    Removed outline on accordion summaries

[33mcommit 7454bbe459d9aab9bc32ee5f1e267e62a2900e93[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 14:57:07 2020 -0600

    Updated tooling to 1.2.0; refreshed

[33mcommit d74b572b21f83de71337061daa2a9df9b9e14ce8[m
Merge: 4fe207e 025244e
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 14:36:29 2020 -0600

    Merge branch 'develop' into rec_accordions

[33mcommit 4a0583edc33501aa217dddf1467f1396376d708e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 14:05:25 2020 -0600

    Refresh

[33mcommit 84d7bbd37abc55352b57bb5fe5192ea7558fa64b[m
Merge: fac5d11 025244e
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 14:00:59 2020 -0600

    Merge branch 'develop' into fhiralltypes_procedurerequest

[33mcommit fac5d115ac96369b62f598ce714cee15344bdb0c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 12:50:57 2020 -0600

    rec12 library reference in ig.json fixed

[33mcommit 3ec299d20467351390940929dbed7326d2a83dcd[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 15 12:41:29 2020 -0600

    Update library names and references; updated to tooling 1.2.0

[33mcommit 025244eca12ec0d342c19e07aa03487e0bfa3ac2[m
Merge: 82e8449 19bdac3
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jul 14 21:45:10 2020 -0600

    Merge pull request #137 from cqframework/issue_134_incorrect_use_substance_abuse
    
    Issue #134 - Fixed misuse of substance abuse procedure valueset; adde…

[33mcommit 19bdac32411471f70cd2feb6eadfdc5db2b0a106[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 14 21:15:26 2020 -0600

    Issue #134 - Fixed misuse of substance abuse procedure valueset; added conditions-documenting-substance-misuse valueset.

[33mcommit 82e84499ee6b6cf6c73f1c40e17ead44149987fa[m
Merge: 2c0e649 e69ce5b
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jul 14 19:51:15 2020 -0600

    Merge pull request #136 from cqframework/issue_135_condition_retrieve_by_category
    
    Issue #135 - Modified Condition retrieves to filter on category.

[33mcommit 4fe207ebc7eb1f05eb16ba1d95c3d85b0b9746ee[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 14 18:26:49 2020 -0600

    Fixed FHIRHelpers source file registration; removed output pages from input.

[33mcommit 43dc76cca89474a8a645bee6962868a935ed0310[m
Merge: ac5f63f 434dbe7
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jul 14 18:05:16 2020 -0600

    Merge branch 'rec_accordions' of https://github.com/cqframework/opioid-cds into rec_accordions

[33mcommit ac5f63f08d638422a1fd5a11dcffb0b63bb477fe[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jul 14 18:03:36 2020 -0600

    removed cql files from all content sections and common

[33mcommit e69ce5b25de27c770c44b445d3cffed85a12e4a9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 14 17:08:03 2020 -0600

    Modified Condition retrieves to filter on category. Refreshed.

[33mcommit 388e8b8f6dff21c9e9821628aefb0e9c39e8e3a2[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jul 14 15:20:42 2020 -0600

    Registered Routines library; update library resource references in ig.json

[33mcommit 434dbe7fcc7447de7830752a3d5d3aef9bfcaa4e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 13 20:41:31 2020 -0600

    Updated library resource references in IG

[33mcommit b1f3c26e0847763f4e5ea4e8611e04ee79c2af48[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Thu Jul 2 13:07:07 2020 -0600

    removed cql links

[33mcommit 490e882630cf8323e8b10c888fb31b566af88773[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Thu Jul 2 12:26:32 2020 -0600

    removing CQL files from recs

[33mcommit f95c4874efa17290f0e4ec996baa8ed41a3c7056[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Wed Jul 1 15:58:52 2020 -0600

     fixed common library links for recs 1-3, 6,9, and 12

[33mcommit 8788b8b7e8ef94d185ca9abfc940503610ff7b87[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jul 1 14:03:24 2020 -0600

    Added common libraries page; Linked to it from Rec04

[33mcommit 935a7cabeccfe52e38ee340c659d480510a69839[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Wed Jul 1 13:39:51 2020 -0600

     added common.xml to _includes & rec 1 to ig.json

[33mcommit 8f5facea057f5f624ab9d5b737ae1f8a974cda1a[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 15:38:08 2020 -0600

    updated charts for each rec

[33mcommit f3755472dcd59fdfe55abcf9f7297deaa2c06eb8[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 13:59:06 2020 -0600

     re added flows 5, 7, 8, 10, 11

[33mcommit 6a7874d842bb9460bf9cb71b7c5b347e13821022[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 13:57:43 2020 -0600

     deleted flows for 5, 7, 8, 10, 11

[33mcommit 65031c126bd7d598192c37dba1cafe78d47434a8[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 13:55:34 2020 -0600

    added in rec 9 w/charts, updated flow charts for other recs and changed to lowercase f

[33mcommit 1026062a9033928b41b082bdc28cedeca6b535be[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 13:32:08 2020 -0600

     re added rec 4 flow

[33mcommit 397508aff94fec93cbb0c7acd140d02dabd472df[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 13:30:25 2020 -0600

    added rec 6 & deleted rec4 flow chart

[33mcommit 85b5e84690348fde904c6c11beaf0a4f8b4bf16d[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 13:01:14 2020 -0600

    Added recs 1-3 including flow and def charts, made changes in documentation & input index

[33mcommit d712055721aaa36bb59df295ce58353bf1a4ac79[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Tue Jun 30 11:41:35 2020 -0600

    replaced functional def with includes & added in def charts to recs 5-11

[33mcommit 8493686ece8fb3e181b9766b88e29d9ea2594e7a[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 22:47:56 2020 -0600

    Added functional description snippets; used functional description in Rec4 page.

[33mcommit 2c0e649bb514923433352c7234cffbf3fcfbfd2a[m
Merge: 024851a ddcb55f
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Jun 29 21:47:49 2020 -0600

    Merge pull request #132 from cqframework/rec0412
    
    Recommendations 4pv & 12

[33mcommit ddcb55ff44b39e0e968cde7ef14641f68c5be062[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 21:20:29 2020 -0600

    Fixed oncology-specialty-designations vs file name; updated txcache

[33mcommit 9e1b1b1f8037d9860766ef6286d3eaa9c2e9022e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 20:52:04 2020 -0600

    Fixed Rec04 Title - remove reference to "Rate"

[33mcommit 88cbb7bc28b296e03bbead8c529090b8c61f426a[m
Merge: f76b95e 2dfcaa2
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jun 29 20:43:58 2020 -0600

    Merge branch 'rec_accordions' of https://github.com/cqframework/opioid-cds into rec_accordions

[33mcommit 8a213216c29e37c346fcc815b94c150d07486fb3[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 20:29:53 2020 -0600

    Added code for units in some examples and requests; recs 4, 10, 11, 12 bundle.

[33mcommit 09613ca918a9d46cc69b82a20d3ddae77504c225[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 19:38:05 2020 -0600

    Refresh

[33mcommit 5a1cfb788ed7fbf3027454f866cfe99bf0b2e165[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 19:34:35 2020 -0600

    Added rec10 reference medications to quick start bundle.

[33mcommit 0e0276266d397ed8c099ccb8d6aa2724c9190832[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 19:21:13 2020 -0600

    Added refreshQuickStart script.

[33mcommit f76b95eaafbabb53457fd68c3ec087fa9eebdfcb[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jun 29 17:58:57 2020 -0600

    added in all of rec 12 html, and into documentation & input index, created new css file and subcats to recs 4-11 as well as wrapping cats in accordions

[33mcommit 450e9d66760c08d35b46ddd3008f0d4195fb5257[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:52:12 2020 -0600

    Increment to v1.2.3

[33mcommit ae6acb2ab007c9813ef7df28142c4145a546cca0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:35:15 2020 -0600

    Incremented version to 1.2.3

[33mcommit 1547a2a49d321f955a2c8ce1b8f1be16fe56251c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:34:51 2020 -0600

    Remove reference to "rate" in rec4 page title

[33mcommit a0af817dbfb30ad7a8b3372b419809cf4a3cfeea[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:33:49 2020 -0600

    Changed example request medRequest.categories to 'community'

[33mcommit 35a9f65528a7f4e4948fb9e3f455c826ce5c4af7[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:31:56 2020 -0600

    Rec12PV - Added DetectedIssue return; Fixed bug in Procedure retrieve date constraint

[33mcommit fcebb2220fd00c1cadc4968562195656bd0020a0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:30:39 2020 -0600

    Added DetectedIssue to Rec04PV

[33mcommit 2bf3f88ae0d1155d860180826199f6153d69e2d5[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:26:08 2020 -0600

    updated txcache

[33mcommit 3f5e8cc10e8b5416acae8543a3b9f92278a4f849[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:25:28 2020 -0600

    Updated Rec04pv plandefinition

[33mcommit 904ab48040306798dbea71f6339ff035d15b2d5d[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:19:58 2020 -0600

    oncology-specialty-designation-enum valuet set ID change to oncology-specialty-designations-enum

[33mcommit d1f291877bb42da08fde54d485253e5e5db4326e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:16:13 2020 -0600

    Rec12 plandefinition

[33mcommit cd028020342e491264e1217302286d2af285e3ed[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:15:57 2020 -0600

    Additional Rec04pv requests/responses

[33mcommit 6392e600a69d6f09fc0586130e78f9df5005094d[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 29 14:15:07 2020 -0600

    Rec12 examples and requests

[33mcommit 2dfcaa27afec7f6e4c6fe9c3a1cbf0136f02e9a5[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Jun 26 17:25:57 2020 -0600

    removed summary outline

[33mcommit 915f7bbd986592b2d320167153f27008aafb4fc3[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Jun 26 16:58:31 2020 -0600

    removed border around accordion summaries. Changes rec4 chart size

[33mcommit 976b14f926c2e928ec8c57bf67ced3ace2238c39[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Fri Jun 26 16:40:10 2020 -0600

    changed rec4 flow chart added accordion

[33mcommit 024851a9258cd05caca687fd260caf577e2f1d66[m
Merge: ddb6353 9d9ca18
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Mon Jun 22 22:07:44 2020 -0600

    Merge pull request #131 from cqframework/rec4_titleChanges
    
    issue 130-  rec4 and rec4 patient view titles changed & txcache

[33mcommit 9d9ca187342d78ce796499727e0d16a4f5d60fea[m
Merge: af10f3a ddb6353
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 22 22:02:14 2020 -0600

    Merge branch 'develop' into rec4_titleChanges

[33mcommit af10f3a6f86a23d8a0b09f7dc9117a8e2c293726[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 22 17:17:36 2020 -0600

    Add txcache (corrected casing)

[33mcommit 895d716955dfa036e8946b31a6ec70a40679f5a8[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 22 16:10:09 2020 -0600

    Removed txCache temporarily

[33mcommit 84fbc7ff068773830c505c0abb0329ba11abd6c4[m
Author: madelynarsenault <madelyn.arsenault@gmail.com>
Date:   Mon Jun 22 15:54:19 2020 -0600

    issue 130-  rec 4 and rec 4 patient view titles changed aswell as txcache file name

[33mcommit ddb6353e82a4db64458876b374b499988d3a9e14[m
Merge: c1933d2 9cc89ae
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jun 16 21:48:27 2020 -0600

    Merge pull request #128 from cqframework/ig_ver
    
    updated IG resource version.

[33mcommit 9cc89ae698de09e2c7a80032ea977965910d0615[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jun 16 17:02:00 2020 -0600

    Modified page footer to new format including IG version

[33mcommit c0eab2e5caa0388fcb8163dfbbf1e7598d56ae55[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jun 16 11:42:48 2020 -0600

    updated IG resource version.

[33mcommit c1933d2736f85a5439bac3587254df17f66ed901[m
Merge: 5883c7a 03e7b1f
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jun 16 11:22:22 2020 -0600

    Merge pull request #126 from cqframework/issue_91
    
    Issue 91

[33mcommit 03e7b1f6525c295e26b543525bf7dad460422f4a[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jun 16 08:34:29 2020 -0600

    Removed duplicate ToCode function in Common and use FHIRHelpers; Refreshed artifacts and QuickStart bundles

[33mcommit e6d5e09ee5edae22a793c84f2bf62f42b313d051[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Jun 10 08:33:45 2020 -0600

    Trigger Build

[33mcommit 26a0d59e424975c3e3f0ee515f73fa9d0d539be2[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jun 9 23:10:18 2020 -0600

    Updated txCache

[33mcommit 0d9b46adccf28d1b9902eedb1a7eab99ca94ba40[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jun 9 22:46:49 2020 -0600

    refreshed artifacts

[33mcommit 78272a2aba1c4088a1872804623300836a47aab9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Jun 9 22:46:36 2020 -0600

    Remove ProbablyDaysInRange and GetPeriodDays; Filter Rec10 Observation retrieves to exclude bad statuses

[33mcommit 5883c7a271a46e05eb9ce244ef38d2dc2eda4d17[m
Merge: 3eed7c2 9f42e95
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Jun 9 08:42:36 2020 -0600

    Merge pull request #125 from cqframework/temp_19300_code_removal
    
    Temporary exclusion of LOINC|19300-3

[33mcommit 9f42e95dae25d4428c669749f93bdba4aa7f9ac7[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 8 22:49:16 2020 -0600

    refreshed artifacts and QuickStart bundles

[33mcommit 3eed7c223ca9da0197b90837ac5f66ee0da7b5f5[m
Merge: 29ebe58 7f93849
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Jun 8 22:41:43 2020 -0600

    Merge pull request #124 from cqframework/archive_opioid_urine_screening_valueset
    
    Archived 'opioid-urine-screening' valueset - only referenced in DSTU2

[33mcommit 661846b922e6952418e98a877d1c97a80f7f130a[m
Merge: 06419c9 7f93849
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 8 22:05:13 2020 -0600

    Merge branch 'archive_opioid_urine_screening_valueset' into temp_19300_code_removal

[33mcommit 06419c9fc2b9204b26ca599b9116e961db478473[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 8 18:11:08 2020 -0600

    Excluded code 19300-3.

[33mcommit 7f938499dee4c8e576dd996bf32d32ab946dddd4[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 8 16:34:35 2020 -0600

    Archived 'opioid-urine-screening' valueset - only referenced in DSTU2

[33mcommit 29ebe58e88918fa0ce74aa0f389f442b90a08f62[m
Merge: 88b8f47 ae07974
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Jun 8 16:02:08 2020 -0600

    Merge pull request #123 from cqframework/quickstart_common_update
    
    Updated common library in quickstart

[33mcommit ae07974110ba1672b4322b1011b698d8c288404e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 8 15:47:22 2020 -0600

    Updated common library in quickstart

[33mcommit 88b8f4780966d78cd1d75a9162a115e3864982b8[m
Merge: 7828fde f8c5702
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Jun 8 11:29:00 2020 -0600

    Merge pull request #122 from cqframework/MedRequest_authoredOn_filter
    
    MedRequest authoredOn filter includes Today(); refreshed.

[33mcommit f8c57026301bf6f2f510a5231f22a3754374efea[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jun 8 11:16:45 2020 -0600

    MedRequest authoredOn filter includes Today(); refreshed.

[33mcommit 7828fde2e0c6908aab188b27182266e9513baab5[m
Merge: 1d4d446 8c635c6
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Fri May 29 09:28:00 2020 -0600

    Merge pull request #121 from cqframework/duration_in_days_unit_fix
    
    Duration fix and MedicationRequest Retrieve refactor

[33mcommit 8c635c671661a37dacc52182925945a0715dd38e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 29 08:50:25 2020 -0600

    Rev to 1.2.2; Fixed all quanties to pass Code in requests; Refactored MedicationRequest retrieves in Common

[33mcommit 8a0c6a5e08fef93d914394e2834b65ca80890475[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 27 23:37:06 2020 -0600

    Modified Common.GetDurationInDays to use Duration.code

[33mcommit 1d4d4461e9fe1391e3d13a8e6d932305735b4cd1[m
Merge: 8d6ccc1 21091c9
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Wed May 27 22:10:16 2020 -0600

    Merge pull request #119 from cqframework/medications_in_quickstart_bundle
    
    Added the medications referenced in Rec10 requests to QuickStart bundle

[33mcommit 21091c9e6a16a4051b3901c5d0587c6639a87908[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 27 19:44:27 2020 -0600

    Added the medications reference in Rec10 requests to QuickStart bundle

[33mcommit 8d6ccc13f18fa024735ab99efd108f043d5b372a[m
Merge: 33c069a d38eeaf
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue May 26 17:15:07 2020 -0600

    Merge pull request #118 from cqframework/txCache
    
    txCache -> txcache test

[33mcommit d38eeafe4597040282566e7bbb34b211daba6431[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 26 15:30:46 2020 -0600

    rename txCache to txcache

[33mcommit b14017580f3b2b34ae2aa847b9657fe2736cd43b[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 26 13:52:49 2020 -0600

    Add txCache

[33mcommit 4dbb716a15b958f74fc2bca01ba0c310cd37dc33[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 26 13:51:11 2020 -0600

    Remove txCache

[33mcommit 4e7d9dc7ce49a9e0b82ef2414ab1aaa7d4024be0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 26 11:44:26 2020 -0600

    Rename to txCache

[33mcommit c9daedb1657af1e81fa665ef412e48fc2211528c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 26 09:09:31 2020 -0600

    txcache rename/refesh

[33mcommit 2900675f4b31836da874da731fdbebf3e422b41d[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 23:35:59 2020 -0600

    txCache config change

[33mcommit 33c069a39711c93521cfcede03f180f4f0c2d9c4[m
Merge: a339f4d b60da3d
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu May 21 22:17:05 2020 -0600

    Merge pull request #116 from cqframework/1.2.1
    
    Update QuickStart bundles - version 1.2.1

[33mcommit b60da3d499f4249af1bcea1c758115aeebee2e7f[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 21:56:05 2020 -0600

    Update QuickStart bundles - version 1.2.1

[33mcommit a339f4deee808bf8af98a0359562f8ecf756f680[m
Merge: 80754cd 0c06d83
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu May 21 17:05:56 2020 -0600

    Merge pull request #114 from cqframework/rec-backport
    
    Rec Backport with new terminology

[33mcommit 0c06d835db8d198d2b35c2c0ab18fae775936b50[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 16:37:43 2020 -0600

    Updated version to 1.2.0

[33mcommit c71b721c93c8e20701992a210302f624cbfb2368[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 15:53:18 2020 -0600

    Updated Terminology page for new terminology.

[33mcommit 0408989e2ec45e2b358b67a572a447ca95d054fa[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 13:14:29 2020 -0600

    Fixed valueset misspelling

[33mcommit 9edb77d2a6a186d875788b519f112b42de997eb8[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 13:07:36 2020 -0600

    Terminology updates/fixes

[33mcommit 1205d1021a14c6a7625e7be1d6c62afd1bfbace1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 09:52:26 2020 -0600

    revert txCache name

[33mcommit c50e3736f35b786c8b0ec4a33e63f9f1ca4ff4b8[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 08:34:01 2020 -0600

    Remove ELM; fixing broken links.

[33mcommit 8ccd97f0ef317be1999779cc44f59f80a3f6eb5a[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 07:39:52 2020 -0600

    txcache rename

[33mcommit c6bab36c5ea7aefdc14ef5831edfdc78c04f37e8[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 21 07:20:11 2020 -0600

    Commit of txCache

[33mcommit d830cc582efa99727378b3e452b57cd79dde0f3c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 20 22:47:48 2020 -0600

    Added medication resources to quickstart bundle for Rec10

[33mcommit a1a95ad1f0149e941292087762bedb3936992062[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 20 22:19:51 2020 -0600

    Define Patient context in Common; Added ProcedureRequest return back to Rec10pv; refresh QuickStart bundles; refresh all bundles

[33mcommit 2d19751580c9ff8a18c0d8953c2e0d07b8b7df0b[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 20 21:02:54 2020 -0600

    Modify refresh scripts to not post to sandbox; remove runant batch file.

[33mcommit e9a23415ae2dbd3aab7335bb133bcbcf796d1aa9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 14 09:32:50 2020 -0600

    Update Recs 10 & 11 pages.

[33mcommit 97f77641b5c01a98ceddd02be9958fdac599f960[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu May 14 00:09:55 2020 -0600

    Fixed bug in "Is Benzodiazepine?"; Fixed Rec11 requests; refreshed resources; fixed Rec11 PlanDefinition

[33mcommit 7d71b433002954459b97b91ad4c1ff7cd4638324[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 21:49:47 2020 -0600

    Fixed rec11pv PlanDefinition hook

[33mcommit d269c5f215e236c916f6f0c129333eec50f7bb4a[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 21:34:02 2020 -0600

    Update PlanDefinitions; "Is Opioid Analgesic with Ambulatory Misuse Potential?" fix; resource refresh

[33mcommit da9ff01111f6dbc95365e01f2618f27c71bf95bb[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 19:39:20 2020 -0600

    Updated Recs 10&11 pv PlanDefs

[33mcommit ab6458e9b4874d4932f31991097d88447a53a515[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 11:34:20 2020 -0600

    Rec11 bundles

[33mcommit 2c583f7d7dc33e388ddf68fd78b96cbe71f31d33[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 11:25:55 2020 -0600

    updated Rec10 DataRequirements

[33mcommit 09f784f188d06a9efc42880d97642098051a6b81[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 11:12:45 2020 -0600

    Rec10 bundle

[33mcommit 9cacc37a70607f9c6ecb3fa2022b7cd8ea0e0e6c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 10:29:06 2020 -0600

    Refreshed libraries and 10pv, 11pv bundles

[33mcommit 3459c45edc5492db622473304b80bce5bd3c3df0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 13 08:17:02 2020 -0600

    Recs 10pv and 11pv bundles

[33mcommit 8ef215f9a353e1d58ec66b5b0cae5d3dd065f2af[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 23:34:27 2020 -0600

    Updated OpioidREC11PatientView DataRequirements

[33mcommit e999a7caea60bfeefd8e5f6644832f8a9543cf03[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 23:17:06 2020 -0600

    FIxed ActiveCancerTreatment polarity error; Rec10PatientView updated DataRequirements

[33mcommit 55bd91ca9e31780838b240e0a5966fb9f98ce468[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 18:38:03 2020 -0600

    Rec10pv refresh

[33mcommit 0a56384790f41b6290096a8ac9363756569e5ea9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 18:36:03 2020 -0600

    REC10PV DataRequirements

[33mcommit 8bc7182f73990cf7b76d9682542e0f140bcc9a54[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 14:57:55 2020 -0600

    Renamed plan definitions; updated libraries

[33mcommit a5094d9c245ce91cd8cd1d8f1e36542c2dce9f84[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 12:24:20 2020 -0600

    Refreshed libraries with proper relatedArtifacts and dataRequirements

[33mcommit b8e66c0f93230508ba3008a1597f8727a8569c23[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue May 12 09:21:15 2020 -0600

    Added new terminology; updated Rec10 PlanDefinition; Manually changed DataRequirement codeFilters

[33mcommit 078dc11d5b71202ab5cd86beb219e1a7d03889e6[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 14:05:05 2020 -0600

    Fixed Rec7 cql.

[33mcommit 33e00cf74471454483c949a48baf02fdaa4e5d74[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 13:42:14 2020 -0600

    Updated refresh scripts to include igrp; Refresh libraries - relatedArtifacts updates.

[33mcommit 5ce313a0136fa21211754ed5cca052444b8e62c2[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 13:10:59 2020 -0600

    point refresh to cds-sandbox; refreshed libraries.

[33mcommit 65791f0731d237308326012cfbe186a59551f901[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 10:00:39 2020 -0600

    Update Rec10 PlanDefinition for new logic; Added ActivityDefinition for Rec11

[33mcommit 48108d2da0d38204eef80cef22e32e64f0c02df8[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 09:59:47 2020 -0600

    Restored CDC guideline relatedArtifact; Removed softwareSystem extension; Refreshed for stu3 rather than r4

[33mcommit 22e1645fe776cb2ae7e544d2951e9a1ca5180746[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 08:40:26 2020 -0600

    Commented out ProcedureRequest retrieve due to Publisher issue.

[33mcommit a0430dea716ae77da28f9f52fa34698d7c4f081c[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon May 11 08:39:12 2020 -0600

    Update refresh scripts to Refresh for stu3 and unversioned.

[33mcommit 12f767e3397595efb02d3a123bf8a89a6f5e0d66[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 8 18:10:16 2020 -0600

    Renamed libraries per refresh.

[33mcommit 8852df00a77f614185b46bef070f0ee4f8949ce1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 8 14:18:19 2020 -0600

    Changed cds-hook from medication-prescribe to order-select

[33mcommit 0344f0e62189b47608e3a939f83c6e7fec2555a1[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon May 4 22:08:20 2020 -0600

    #104: Updated library file names and identifiers ... added rec 4 and 12 patient view logic

[33mcommit 80754cde347b64b4aac5f4da5e34c7c506b6615a[m
Merge: 6c310c2 fd35fc8
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Sat May 2 10:54:29 2020 -0600

    Merge pull request #113 from cqframework/remove_postman_bundle_link
    
    Removed postman bundle link in Quick Start

[33mcommit fd35fc8c9498f52e358d195981b3ee596afb05f9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 1 17:12:04 2020 -0600

    Removed postman bundle link in Quick Start

[33mcommit 6c310c24c54e495009a334936cbb789da2d22a27[m
Merge: f137160 ce60092
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Fri May 1 16:34:27 2020 -0600

    Merge pull request #112 from cqframework/ruler_url_fixes
    
    Fixed ruler URLs in examples; Updated updatePublisher script

[33mcommit ce600929f73df0303d8c97f80000bef4f41888e5[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 1 14:00:31 2020 -0600

    Fixed ruler URLs in examples; Updated updatePublisher script

[33mcommit f137160696514034d4c94cc9785dff0e3a37e188[m
Merge: 13e81e6 9da7ac2
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Wed Apr 29 15:24:17 2020 -0600

    Merge pull request #111 from cqframework/update_requests_fhirServer
    
    Updated fhirServer in cds requests

[33mcommit 9da7ac236519e97650d302a2f7a963284c2dceed[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Apr 29 15:20:12 2020 -0600

    Updated fhirServer in cds requests

[33mcommit 13e81e69a2ef163f3cb2b99f34571ce74417c01d[m
Merge: 94084f1 cdd2c98
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Mon Apr 20 11:42:01 2020 -0600

    Merge pull request #110 from cqframework/rxsig-dev
    
    Added RxSig CQL logic to archive

[33mcommit cdd2c9853fccd5f9e193b4efe13de65e843b3cab[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 20 11:33:20 2020 -0600

    Added RxSig CQL logic to archive

[33mcommit 94084f11f15eb3c441c665216127c42389edc9e9[m
Merge: 6188b77 f893452
Author: c-schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon Apr 20 11:29:47 2020 -0600

    Merge pull request #109 from cqframework/expose_patient_view_tests
    
    Expose patient view tests

[33mcommit f89345287b45f1046ef9d744907fd383614d03ce[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 20:28:02 2020 -0600

    Exposed patient-view requests in test data

[33mcommit a3dcce2bb6e9e4d31b3282377cd1d8a08979c293[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 20:27:34 2020 -0600

    Updated resource names within patient-view requests

[33mcommit 6188b77f7cf4a30ac357427a6041850821bf8982[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 16:08:45 2020 -0600

    Remove build files

[33mcommit 039964810187eac2f074d1fe3e22b4155f2f8ce0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 16:08:17 2020 -0600

    Updated genonce script; ignore build files.

[33mcommit c818563636e9a0b5116eab83a3ad132b499ce535[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 15:58:04 2020 -0600

    Added update/refresh scripts; move publisher to input-cache; added patient-view tests to test data page

[33mcommit f48097292dcd575f276b7c78fddda1c140bfcafb[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 12:21:59 2020 -0600

    Fixed fhirServerUrls throughout

[33mcommit 4869c200416b5b2c8423e049a139e026cb150af1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Apr 14 12:19:43 2020 -0600

    Added refresh.sh and genonce scripts

[33mcommit f58a69024617420895b4cf95fdeb31bdccfc0355[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Mar 27 08:59:17 2020 -0600

    added _createValueSetsFromSpreadSheets.bat

[33mcommit 4ba28aa93024da27f24e5ee7b711e07446a40b23[m[33m ([m[1;33mtag: v1.1.1[m[33m)[m
Merge: 196b709 af4383a
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu Feb 27 09:46:51 2020 -0700

    Merge pull request #105 from cqframework/v1.1.1
    
    v1.1.1

[33mcommit af4383a3c46f830ce1b5d0a7967a0c8612df7111[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 26 17:08:35 2020 -0700

    Fixed rec11-patient-view opioid with benzo request

[33mcommit 42a046f040339f08bbc6757830917302a0dd9440[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 26 15:07:28 2020 -0700

    Updating library data requirements ... revving to v1.1.1

[33mcommit 196b7093eaa14d04fbd98e0b061f70964f3b9151[m[33m ([m[1;33mtag: v1.1.0[m[33m)[m
Merge: 825f20e 6db027b
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Feb 18 17:12:20 2020 -0700

    Merge pull request #102 from cqframework/v1.1.0-template
    
    v1.1.0

[33mcommit 6db027ba62fd0200fb9d7b00b207d34e131bf6d1[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Feb 18 16:38:44 2020 -0700

    Updating rec-11-patient-view requests ... adding benzodiazepine med to quick start bundles

[33mcommit c92c47184bd4a292528c8ef4bf5f509ed2a419c0[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Feb 18 15:34:59 2020 -0700

    Added Medication resources to quickstart bundles

[33mcommit bbea8907d382f1a1f7bdf129561b6c9a5f8ea3fb[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Feb 18 13:22:30 2020 -0700

    Added versions to quick-start bundles

[33mcommit f4c1352927bc31db62009bcb70a9bfb52ca77446[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Feb 17 02:40:34 2020 -0700

    PR to replace #101 due to excessive conflicts

[33mcommit 825f20e5d8c6ec274dc34bd54026e0c3479f9ece[m
Merge: ce7cadd 169ed9c
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Sat Feb 15 14:18:27 2020 -0700

    Merge pull request #100 from cqframework/templatization
    
    Templatization to work with refresh tooling

[33mcommit 169ed9ceed487c0a166059786a178f75dc7afaac[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jan 27 21:34:46 2020 -0700

    Renamed files to satisfy naming convention

[33mcommit d7b54c0412394d9a2135f1836a6dc776dbad42d5[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jan 27 16:10:24 2020 -0700

    Renamed files and resources; re-generated using tooling (IGRefresh)

[33mcommit 4909234a2c037153bf887556944874f48d730f5e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jan 27 08:47:09 2020 -0700

    Revert from template approach (not supported for STU3)

[33mcommit e18f35de4b3f21c7bf2d6d7eae6c85912b47987e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Jan 24 08:15:24 2020 -0700

    More templateization changes

[33mcommit 7d08f021d4a01fb74ffa01193f302032197fad8b[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jan 16 21:10:24 2020 -0700

    Restructure and relocate per template

[33mcommit ce7cadd10e10ffacc88732688c3d777776ecada8[m
Merge: f685f6b 5517587
Author: c-schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Thu Jan 16 20:36:20 2020 -0700

    Merge pull request #97 from cqframework/epic-modeling-refactor
    
    Epic modeling refactor

[33mcommit 5517587ecbbce824b35d20884eb08105ccfdab50[m
Merge: 8356bb2 7279c81
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jan 16 20:27:19 2020 -0700

    Merge branch 'epic-modeling-refactor' of https://github.com/cqframework/opioid-cds into epic-modeling-refactor

[33mcommit 8356bb2b089b0e80309731c9f6a4ba143749382e[m
Merge: 13af724 f685f6b
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Jan 16 20:21:26 2020 -0700

    Merge branch 'master' into epic-modeling-refactor

[33mcommit 7279c81ea50c81eaf6872a7bf9f87c28a5e6ad4b[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Jan 16 20:10:58 2020 -0700

    Updated Quick Start

[33mcommit 13af724d329088a40b8764ae0572757dbae0e224[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Jan 16 19:54:57 2020 -0700

    Updating requests

[33mcommit f685f6b5cd9f8436958cf18a7bdebd60129f03dc[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jan 13 17:23:42 2020 -0700

    Committing 0.0.3 version of OpioidData library (refresh Jan 2020)

[33mcommit ba3fe2f19335ea34b53d3d65a667462ab4703a7c[m
Merge: d1404c5 d8c0395
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jan 13 17:08:50 2020 -0700

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit d1404c57836b868c65c87a26d85ccf13a6bcb3dd[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jan 13 17:08:05 2020 -0700

    Committing 0.0.3 version of OpioidData library (refresh Jan 2020)

[33mcommit d8c0395e37152c4bebb04613377c191bda09c55c[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 20:19:26 2019 -0700

    added version to interpretation

[33mcommit d236b6677fceb102cb9688c2a9f3774518ecd966[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 20:03:53 2019 -0700

    added display to interpretation

[33mcommit 07e0c0f42d4656fd9390a783749795b784d8488e[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 19:53:03 2019 -0700

    POS

[33mcommit 95f76f27d795483941839294ed86b30d283d163a[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 19:47:35 2019 -0700

    POS to positive

[33mcommit 135115e70f8ed67090a7395178c1297df81febd1[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 16:12:31 2019 -0700

    fixed naming

[33mcommit 33ebb7e26cb04a9b26aa58269a03530846ce9946[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 14:06:17 2019 -0700

    added patient-view specific responses for rec-11-patient-view

[33mcommit 3ea26c0828eeebe9b5758413b220b1dc35c79136[m
Merge: 8e4b73e 9fdc8bf
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 13:44:14 2019 -0700

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit 8e4b73ea29131a78065b4d41e864240abf8807ce[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Fri Dec 20 13:43:58 2019 -0700

    updated responses for rec 10 and rec 11 to reflect cql changes

[33mcommit 9fdc8bf535b96f3b84c1de85d2aab2da0bd8b19b[m
Author: c-schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Thu Dec 19 18:32:00 2019 -0700

    Update library-opioidcds-stu3-common-0-1-0.xml

[33mcommit cab7d94c6b3e988da2baa5ac5ecabd52f49d6004[m
Author: c-schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Thu Dec 19 18:26:58 2019 -0700

    Update library-fhir-helpers.json

[33mcommit f47a3c06c84453a17ab75d9c031cf88185ca6716[m
Author: c-schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Thu Dec 19 18:25:55 2019 -0700

    Update library-omtklogic-0-0-1.xml

[33mcommit 1c081eea9c322d2aece3b13b17c255e2a273fc75[m
Author: jreyno77 <inujosha1@gmail.com>
Date:   Thu Dec 19 15:59:36 2019 -0700

    remove /_history from library resources

[33mcommit b183aca5a61394ff73fa78ea03452c22c45e282d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Dec 19 05:54:40 2019 -0700

    Commented out chronic opioid use logic for pilot

[33mcommit c6af908bf78e859d7514b047836f3725fbe1873b[m
Merge: 5651362 c258620
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Fri Nov 15 13:52:01 2019 -0700

    Merge pull request #89 from cqframework/quickstart_prefetch_update
    
    Quickstart prefetch update

[33mcommit c258620b7fd98ebd1c67b07218c6714735642820[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Nov 15 13:46:23 2019 -0700

    Quickstart prefetch formatting

[33mcommit 120fdf6ca0f6bd66b273807ff235a70747791c45[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Nov 15 13:39:38 2019 -0700

    Updated the prefetch example in the Quick Start

[33mcommit 56513629d4bc74b65e13106314413230e13d897c[m
Merge: 86bde39 d22c5f9
Author: c-schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Fri Nov 15 12:52:23 2019 -0700

    Merge pull request #88 from cqframework/quick_start_TLC_2
    
    Changed Bundle vs Resources load order; fixed discovery URL

[33mcommit d22c5f9c31964d0a0ee449dee7786d5928065db0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri Nov 15 12:47:27 2019 -0700

    Changed Bundle vs Resources load order; fixed discovery URL

[33mcommit 86bde393f5c57f2a3c1e0a37fb0f6d8c5285a186[m
Merge: 0d85be1 f62cfe7
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 14 22:19:37 2019 -0700

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit 0d85be12b4f9f2ef9447304e309376ba5cf62010[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 14 22:19:22 2019 -0700

    FHIR version update; updated publisher

[33mcommit f62cfe7ef5980c0cf06d7515ab64c28413525334[m
Merge: 384277f 5e61e1c
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Thu Nov 14 22:15:35 2019 -0700

    Merge pull request #85 from cqframework/QuickStart-TLC
    
    QuickStart cleanup; QuickStart Postman collection

[33mcommit 5e61e1cdfe861e0bfd6980990fb0ece306e90a9a[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 14 22:13:54 2019 -0700

    Updated publisher

[33mcommit 76edcaecda7f940e0ae4a48dd8fdba19b7ab5031[m
Merge: 1ae10f7 384277f
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 14 22:07:41 2019 -0700

    Merge branch 'master' into QuickStart-TLC

[33mcommit 384277feddbaa339cf685b6377ee25f57d1beb28[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Nov 10 22:34:28 2019 -0700

    Updating FHIR version in ig.json

[33mcommit 949830fbc5d7ba71e120030e330cd5c75131e02e[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Nov 10 22:29:57 2019 -0700

    Added quantity code to common duration resolution logic ... Updated artifacts ... Added examples and bundles

[33mcommit be6f98d29bc92037c007e1cf0d5cb65eb467e374[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Nov 4 14:14:57 2019 -0700

    Updating rec11 cql and artifacts - changing Condition retrieval

[33mcommit 0700f9db65bfc37aadfb37c1d58aad7c273fdee9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Oct 2 22:00:32 2019 -0600

    Fixed bad link.

[33mcommit 1719c3a7bd3c7acd6d6bb90b9be9ddda7587a0e6[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Sep 23 18:41:28 2019 -0600

    Updated artifacts, requests, quick-start, etc with new logic

[33mcommit ad138422f5e56f05149bb5583579b7545b9e12b5[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Sep 23 14:17:03 2019 -0600

    #87: cleanup and refactoring to conform to standard conventions

[33mcommit 615c7e3536534892cdf95ceecf0cb0a706ab21aa[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Sep 23 13:02:32 2019 -0600

    Refactoring the logic for recs 10  and 11 to adhere to EPIC's FHIR modeling

[33mcommit 1ae10f78e3e8dc0c59cf7107829d493205b39f8f[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Sep 18 08:13:59 2019 -0600

    Added publisher jar for local testing ... fixed grammar and urls

[33mcommit 3d5f9d9f069b42e9abebb99eeb33c9aac0659735[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Sep 17 15:50:12 2019 -0600

    QuickStart cleanup; QuickStart Postman collection

[33mcommit dfb9701fe1117fc69c2968946f9ce6c17ee17687[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Sep 12 12:14:25 2019 -0600

    Fixed entity reference in quick start.

[33mcommit a084ffe1036632709f6187191952fd95a7cc4e79[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Sep 12 11:39:30 2019 -0600

    Undid changes to risk assessment (R4 changes that should not have been applied to this branch). Also removed old ig publisher.

[33mcommit a1324aeffe4c50a70267f4ef0edc84f59834d8e6[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Sep 12 10:39:45 2019 -0600

    #84: Removed references to unavailable resources on US-Core compliant servers.

[33mcommit c77b5cebf062125bb423ba78953392f8fd8e4b6d[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Aug 26 14:26:11 2019 -0600

    Changed dosage in Rec10 example

[33mcommit 51a63cce89537c6b055ab3bf8b91cb0df26482d0[m
Merge: 7b805c5 38745a4
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Aug 19 21:09:39 2019 -0600

    Merge pull request #80 from cqframework/rec10_patient_view_component_code_fix
    
    Removed "component_code" retrieve from Rec10_Patient_View

[33mcommit 38745a4880386cee9f1ea2be7d36d11a6aa50f20[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Aug 12 12:55:43 2019 -0600

    Removed "component_code" retrieve from Rec10_Patient_View

[33mcommit 7b805c5e2bf16852ab7f2e7d2fb5f3f0e7fe444c[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Jul 2 18:48:07 2019 -0600

    Fixed incorrect references to library-fhir-model-definition.

[33mcommit c37693341f2c1489e127a26c1de9797c3d6ccb18[m[33m ([m[1;33mtag: v0.1.0[m[33m)[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Jul 2 14:39:17 2019 -0600

    Updated incorrect reference to FHIRHelpers library.

[33mcommit 32bea5e5372583c8c62bceec0650adce6d53fe5d[m
Merge: 3dfef46 e3542e8
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Jul 1 21:17:57 2019 -0600

    Merge pull request #76 from cqframework/MIH543_CDSHooksSandboxInQuickStart
    
    Added documentation for CDS Hooks Sandbox in the Quick Start

[33mcommit e3542e8f17728233c22539d121d4c05c81057d93[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 1 20:30:37 2019 -0600

    Formatted settings as code snippets; Updated example Patient resource to include Name

[33mcommit 3dfef46e94963b7ab63a9da8a3207630dd7e9d55[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jul 1 16:17:39 2019 -0600

    Committing version of OMTKData that uses medication knowledge resource

[33mcommit 12538109928f732ecafb7d6a723d9a5dba77c350[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Jul 1 08:47:40 2019 -0600

    Added documentation for CDS Hooks Sandbox in the Quick Start

[33mcommit b0e09999c49e5acc8843c463f38cdbdb72e07294[m
Merge: af43c89 405ada2
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu Jun 13 20:47:46 2019 -0600

    Merge pull request #74 from cqframework/quick-start-update
    
    Updating cds hooks requests for patient-view hooks

[33mcommit 405ada230e76de4cca7ba009c54a08ab7f3f9f73[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Jun 13 20:46:53 2019 -0600

    #75: Added configuration option to ignore system on category elements.

[33mcommit c86edecec281ceb23e6c9920bcdbb11c21567e9d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Jun 13 13:49:28 2019 -0600

    Updating cds hooks requests for patient-view hooks

[33mcommit af43c8922cc1725622319573ca4af17855927aa7[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Jun 11 23:12:28 2019 -0700

    #72: Adding quick start documentation.

[33mcommit 47b08e189eae7cd0c352ec19ae84e90285b5cb74[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 22:43:33 2019 -0600

    #72: Adding quick start documentation.

[33mcommit e5a60a1ea2df77d62b96cf8cd1fb74e7d74cf575[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 22:33:03 2019 -0600

    #72: Adding quick start documentation.

[33mcommit a1afe214587b2ad0e2f0030196cee92b10b8ea65[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 20:12:17 2019 -0600

    #72: Adding quick start documentation.

[33mcommit b78a7f3ab615353723a7c32f39910d3ca0b1edb0[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 16:28:08 2019 -0600

    #72: Adding quick start documentation.

[33mcommit 2f99216612fe78a14e085dd843fb64d54fc5b19c[m
Merge: a9d9eb1 afa82aa
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 16:26:37 2019 -0600

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit a9d9eb116e8fa85e27b7f6eb936e0520f0973320[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 16:25:37 2019 -0600

    #72: Adding quick start documentation.

[33mcommit afa82aa08823685152c5a1a6e975b798fa38a119[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Jun 3 16:03:05 2019 -0600

    Fixed library reference for recommendation 10 ... updated publisher jar

[33mcommit f99ad6ed4c4c3986af7792d270df979b5e98d9b3[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 3 00:51:58 2019 -0600

    #72: Adding quick start documentation.

[33mcommit 327734e5cad8021d03b2f83cdd1a76172c78e7d4[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Sun Jun 2 16:16:01 2019 -0600

    #72: Adding quick start documentation.

[33mcommit 56aa06dba4792b8247a59d4f7d27d189bdd52ba3[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Sun Jun 2 16:08:19 2019 -0600

    #72: Adding quick start documentation.

[33mcommit 9b8012975c7b664af6b43afe12c870798afe480f[m
Merge: 38b5da9 fe0656c
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Sun Jun 2 14:23:47 2019 -0600

    Merge pull request #71 from cqframework/Issue69_Correct_Urine_Screening_Logic
    
    Issue69 correct urine screening logic

[33mcommit fe0656cf646575137e79aea3e875abab2172b5c7[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Sat Jun 1 18:48:49 2019 -0600

    Updated STU3_Common Resource

[33mcommit e45586c1bf4a479d89827d0ddf8b781663298dd5[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Sat Jun 1 18:43:52 2019 -0600

    Updated Rec10 Resources

[33mcommit 9d8d04c88791fbfa942c1e6fd3cbfb276ea482d1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 31 12:01:19 2019 -0600

    Reverted AgeInYearsAt(Now()) change.

[33mcommit a79757fc1f243b46d21c885127c7a285821ccfe6[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Fri May 31 10:56:08 2019 -0600

    Removed notion of Prescribed/Unprescribed Opioids

[33mcommit ac7d3bafdb2f93c358eb5de92c4d1ef007e75d10[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 29 14:09:51 2019 -0600

    REC10 No longer use drug names and ingredients to determine inclusion

[33mcommit 600464d71fc37d63d5b2cba394dcc7184f092437[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 29 08:10:28 2019 -0600

    Common.CodeableConceptToString functions

[33mcommit 38b5da9ada5f5e37c8626c69a853f2301bb4eb98[m
Merge: 7ee25c5 0bbef4a
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue May 28 15:21:01 2019 -0700

    Merge pull request #70 from cqframework/MIH150_CQL1.3_Repackage
    
    Repackaged Recs 4, 5, 7, 8, 10, 11 for CQL 1.3

[33mcommit 0bbef4a719311e5a67e1f2fdeaee910aee3f8e6b[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed May 15 15:18:08 2019 -0600

    Repackaged Recs 4, 5, 7, 8, 10, 11 for CQL 1.3

[33mcommit 7ee25c5bb5491ec9d6c91ebbff4c87d7d44f4206[m
Merge: 8f22a86 ffb1439
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Fri May 10 12:11:46 2019 -0400

    Merge pull request #68 from cqframework/patient-view-repackaging
    
    Repackaged the STU3 patient-view artifacts

[33mcommit ffb14390affc6f931f8082aff0fdfb156504a1b6[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri May 10 10:10:45 2019 -0600

    Fixed canonical references

[33mcommit 4160e3377a4cfe207c30d72b3ae4a01c4b4133f0[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Fri May 10 04:31:24 2019 -0600

    Backing out incorrect changes to omtk v001 logic and artifacts

[33mcommit 8bec533ce9f8cc63c8cc53de85191c7234012d77[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Fri May 10 04:15:50 2019 -0600

    Removing ambiguous CQL in the  omtk logic v001 library

[33mcommit 1fa82b9dacb146fe28284f2f6c2eeff6a5656f34[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Fri May 10 04:12:00 2019 -0600

    Repackaged the STU3 patient-view artifacts

[33mcommit 8f22a8644ac7620813c3313b72cf5f391a4c181e[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu May 9 22:35:03 2019 -0400

    Added ProcedureRequest and DetectedIssue outputs for Recommendations #10 and #11

[33mcommit fed8a61fe29797aae86eccfe13012ef5e273646e[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu May 9 01:59:04 2019 -0400

    Upgrading content to CQL 1.3

[33mcommit 778eed2057214f6ffc3214794908e09b70d87144[m
Merge: b96e890 d4c1bce
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Wed Apr 24 08:26:26 2019 -0600

    Merge pull request #65 from cqframework/GH-60-FentanylFactor
    
    Update Fentanyl transdermal conversion factor - Resolves #60

[33mcommit d4c1bce97e9d2ecee6a2b6fd6846fe4ab04f9f5d[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed Apr 24 08:25:39 2019 -0600

    Updated library resource.

[33mcommit b96e890fff38a0c2d4d8b0c6e43bd725b45cdad6[m
Merge: a628cb5 e66160b
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Apr 16 20:13:39 2019 -0600

    Merge pull request #63 from cqframework/GH-62-UrineValueSetUpdates
    
    Updated Urine Test Codes - Resolves #62

[33mcommit e66160b504695edbf9bfafa3719766cccc3594b5[m
Author: Jonathan Percival <jonathan.i.percival@gmail.com>
Date:   Tue Apr 16 15:34:38 2019 -0600

    Updated Urine Test Codes - Resolves #62

[33mcommit 47d92f486ad3ceb7030faa3040fe1fd463c3d902[m
Author: Jonathan Percival <jonathan.i.percival@gmail.com>
Date:   Tue Apr 16 11:19:22 2019 -0600

    Update Fentanyl transdermal conversion factor - Resolves #60

[33mcommit a628cb58fb9a43f025ceb05e01fce53bda472b5d[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Apr 1 09:25:07 2019 -0600

    Added opium drugs to OMTKData-0.0.2

[33mcommit bc34d459408e2d109fc6ecbd9da3ab3841ba1d6d[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri Mar 29 14:54:19 2019 -0600

    Updates included from CMS460 measure developers to add missing strengths.

[33mcommit 1fe0f642de584088f588258bf5953ad183996664[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Mar 28 23:15:20 2019 -0600

    Updating OMTK data

[33mcommit 868e65b8ff8634a8d8d49c91fe98d7eb2dda4234[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Mar 28 22:30:42 2019 -0600

    Updating OMTK data

[33mcommit 72152611d8a71bc1454a70a06e85b16f27291bd8[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Mar 28 21:04:45 2019 -0600

    Updating OMTK data

[33mcommit 7405d90a2dee5fd7e30cad5697c17d61ba496841[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Mar 28 21:00:55 2019 -0600

    Updating OMTK data

[33mcommit cdb130b7a28ade15cfc7d4d6ba6ebb6c7d92e61a[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Mar 28 20:58:37 2019 -0600

    Updating OMTK data

[33mcommit 627509248c8a2088b3acd2778f0460854ffd383e[m
Merge: 36fb370 bb55f3e
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu Mar 28 01:36:27 2019 -0600

    Merge pull request #55 from cqframework/patient-view
    
    Added DSTU2 patient-view CQL logic for recs 10 and 11

[33mcommit 36fb370dbbe0032dc2051b216d5254f0107ed69c[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Mar 27 22:35:36 2019 -0600

    restoring OMTKLogic SQL to create CQL tuple selectors

[33mcommit bb55f3ec558fb9bcc61cbfdfe8d5fe17cc1271ec[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 6 23:35:49 2019 -0700

    Added DSTU2 patient-view CQL logic for recs 10 and 11

[33mcommit e78b83c6715902adea7b142ec3af283cd8d2274d[m
Merge: fa48033 d49de85
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Wed Feb 6 22:14:03 2019 -0700

    Merge pull request #54 from cqframework/patient-view
    
    Patient view logic and resources for recommendations 10&11

[33mcommit d49de85e2538f70b9f02cf381f6a8fd33052f56e[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 6 18:50:52 2019 -0700

    Added patient-view artifacts to IG ... updated meta-data ... updated comments in the patient-view CQL

[33mcommit 8d3a0ab6abb52f9e98f985eb1191226837d41b2b[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 10:06:04 2019 -0600

    #51: fixing ids

[33mcommit 54cb1f36f98f7e7237c3bddb4284e431264e0b78[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 09:46:28 2019 -0600

    #51: added library resources and elm for patient-view recs

[33mcommit 34e41acde6b638fce17cc9ca4e60c0bbff48d0a0[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 09:05:10 2019 -0600

    #51: fixed library reference in the patient-view plandefinitions

[33mcommit fa5935be5f3be2854c7b3d13346cb96b616e6632[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 09:01:38 2019 -0600

    #51: adding plandefinitions for patient-view recs

[33mcommit 724f5e64d152130b72aa6769df5166c3728ba180[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 08:07:39 2019 -0600

    #51: added CQL logic for patient-view recommendation 10

[33mcommit 6a6cd825ba63ef166281e39a7f30688642d9f861[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 07:45:18 2019 -0600

    #51: added CQL logic for patient-view recommendation 11

[33mcommit fa48033617d6c4e99bda9a4886b0ea44a8b75385[m
Merge: 615e75d c394b95
Author: c-schuler <hoofschu@gmail.com>
Date:   Sat Jan 12 05:41:04 2019 -0700

    Merge pull request #48 from cqframework/MIH-86-Rec10-Feedback
    
    MIH-86 REC10 feedback

[33mcommit c394b959cc057f45d09d9052e5e4a22cedab3161[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 12 06:36:55 2019 -0600

    Housekeeping ... updated ELM and Libraries with most recent CQL logic

[33mcommit dddddafa9665ae99b6d11c4414c1bda1ec72604e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Dec 12 20:41:57 2018 -0700

    Issue #35 REC10 action-specific Detail and Summary outputs.

[33mcommit 615e75dde3e99bc9caf70a9b58095db759d7cd68[m
Merge: 698d55f 1e45430
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Wed Dec 12 15:39:03 2018 -0700

    Merge pull request #47 from cqframework/MIH-79-MultipleIGIssues
    
    Resolution of multiple feedback issues.

[33mcommit 8efcdc87a5e7fd94184f6595600be3a09f619e83[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Dec 10 17:05:32 2018 -0700

    Issue #35 Added Detail and Summary outputs to REC10

[33mcommit 78f07a376c552263dbcdcf1e2c1698c8ebb0c173[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Dec 10 10:07:13 2018 -0700

    Issue #35 added "Get Summary" and "Get Detail" to Recommedation CQL.

[33mcommit ee24b0e991c9fc6e584e96ad1f79987a272a87a1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Dec 10 09:32:32 2018 -0700

    Issue #33 Document "Missing Opioids" dependency on display values.

[33mcommit 50ed4a7d0e219f7ca3bb9b83ce41a1d22616ad48[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Dec 6 14:16:28 2018 -0700

    Issue #34 GetDrug function rename and documentation

[33mcommit aa1b67dde13967ee4959463f1675711664ec1ba2[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Dec 5 21:27:36 2018 -0700

    Issue #32 Removed unnecessary intersection

[33mcommit 1e45430a7ffa0566309ddd251ac055a2b9d8c388[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Dec 3 11:22:23 2018 -0700

    Issue #27

[33mcommit 19e8455b2b9533c8571b74209eb1ce2e4e6f16c3[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 29 16:13:32 2018 -0700

    Issue #27

[33mcommit b3dace0f6059e9ca1f4a42ad98be11acf9f81cc3[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 29 15:26:56 2018 -0700

    Issue #27

[33mcommit aeea2a7c2421fe5d2e614f6c86755e71563bdbff[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Thu Nov 29 12:34:31 2018 -0700

    Issue #27

[33mcommit 46bdd0b60fcd36ebe91b5f603abd7e5e484dd941[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Nov 28 22:01:10 2018 -0700

    Issue #27 Common.ToCodes overload for List<FHIR.Coding>

[33mcommit aa89bede4c1d6c20e24c6af582e6ff2ee3f74077[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 27 20:00:43 2018 -0700

    Issue #27 Remove single coding assumption

[33mcommit ed9d4cc7dfe39f116d18a7554ac42584c93ec0b0[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 27 16:17:15 2018 -0700

    Issue #27 Remove single coding assumption - End Of Life Assessment

[33mcommit b4260d845a24dfab1013667e8da1a1a26359d4e9[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Nov 26 13:33:26 2018 -0700

    Issue #29 - Support for all duration types in GetDurationInDays

[33mcommit 2e2598abf847cd1ac7978a2918ccee8f9d9a1189[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Nov 21 21:11:57 2018 -0700

    Issue #20 Added expected responses for examples.

[33mcommit b7731afa717be339761e8d10d240d20db8a76fb2[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Nov 21 14:50:04 2018 -0700

    Issue #25 GetConversionFactor Function throw error instead of arbitrary value.

[33mcommit 1f8a4e52a0319fd924fb7e808f293521d253d6f7[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Nov 21 14:42:23 2018 -0700

    Removing duplicated identifiers introduced as part of merge conflict in REC_08

[33mcommit 4d0d26013eb68c80a57e85cd744c68e28bf31023[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Wed Nov 21 08:22:06 2018 -0700

    Issue #40 Add age restriction to Inclusion Criteria for all recommendations

[33mcommit d8d7df30764f4dd67d1a6575a9d95dc51e144ebb[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 20 16:18:04 2018 -0700

    Issue #28 Removed commented-out Sort clause in Common library MME function.

[33mcommit 3a36e42707a15a58b78937fb516fa52137cc34b1[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 20 15:47:02 2018 -0700

    Issue #7 Styled explanation of source for ranges in logic.

[33mcommit 0b9f9d4bc70d13fb52a5109d8ed3ab403c682371[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 20 15:21:19 2018 -0700

    Issue #7 Added explanation of source for ranges in logic.

[33mcommit ba18a0a5b09a6ce2bf3c494227727e06fdbcc763[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 20 14:33:06 2018 -0700

    Resolved Issue #31 - Combining list before concatenation

[33mcommit 698d55fabad92910988f52f887b1aeca9958ebe9[m
Merge: f77c626 0cd06ea
Author: Adam Stevenson <adam@databaseconsultinggroup.com>
Date:   Tue Nov 20 10:14:15 2018 -0700

    Merge pull request #46 from cqframework/MIH-62-ObservationInterpretationRequired
    
    Created Profile in IG for Observation to indicate 1..1 Interpretation

[33mcommit 0cd06ea60493dd722896bddb0eeaa7729a08254e[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Tue Nov 20 10:13:26 2018 -0700

    Created Profile in IG for Observation to indicate 1..1 requirement of Interpretation

[33mcommit f77c6263c3afdc559466ef4a7d1904b443ae221e[m
Merge: 052f3fc 5fefebf
Author: c-schuler <hoofschu@gmail.com>
Date:   Tue Nov 20 02:59:43 2018 +0000

    Merge pull request #45 from cqframework/MIH-58-NullWhenInclusionFalse
    
    Issue #44 MIH-58 null when inclusion false

[33mcommit 5fefebff73e80379501e9fa1625b76e9fccc484f[m
Merge: d5f41b4 86b42ae
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Nov 19 19:58:22 2018 -0700

    Conflict resolution

[33mcommit d5f41b4668e28b1ab6907fa85ec0a0b44d0cd8ed[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Nov 19 19:52:20 2018 -0700

    Updating ELM and resources

[33mcommit 86b42ae1e09a914c79465c8915d45648bed32a36[m
Merge: 10475b7 052f3fc
Author: c-schuler <hoofschu@gmail.com>
Date:   Tue Nov 20 02:19:57 2018 +0000

    Merge branch 'master' into MIH-58-NullWhenInclusionFalse

[33mcommit 052f3fc975e3d0aa0e3419dbb72a25362778f01e[m
Merge: d055537 2e23725
Author: c-schuler <hoofschu@gmail.com>
Date:   Tue Nov 20 02:18:22 2018 +0000

    Merge pull request #43 from cqframework/MIH-59-ExplicitResultComponentExpressions
    
    Issue #42 - Added explicit 'Taper Now' and 'Consider Tapering' expressions

[33mcommit d055537ea04486031fc8aa7544051dcf7a31b272[m
Merge: 442d8ba 59f8176
Author: c-schuler <hoofschu@gmail.com>
Date:   Tue Nov 20 02:11:38 2018 +0000

    Merge pull request #41 from cqframework/MIH-60-FormatConditionsCorrectly
    
    Format descriptions for  Opioid Rec 8 correctly

[33mcommit 59f817628bb975844f234a70092b379731ec9999[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Nov 19 19:10:55 2018 -0700

    Updating ELM and resources

[33mcommit 10475b763d4c83875c13ea36ee753f989e55b654[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Nov 19 19:03:15 2018 -0700

    Issue #44 Modified CQL to return null when inclusion criteria is not met.

[33mcommit bb7a9f5e3262207bfb27d531900d2a4cd6a088fd[m
Merge: 2e23725 b7d6d12
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Nov 19 17:12:07 2018 -0700

    Merge remote-tracking branch 'origin/MIH-60-FormatConditionsCorrectly' into MIH-58-NullWhenInclusionFalse

[33mcommit 2e237252b15e6960f9771944ed540abda63ce74a[m
Author: Adam Stevenson <stevenson_adam@yahoo.com>
Date:   Mon Nov 19 16:12:33 2018 -0700

    Added explicity 'Taper Now' and 'Consider Tapering' expressions

[33mcommit 442d8ba46ce016e5198e247e9276767002d33703[m
Merge: 330552a 97ba756
Author: c-schuler <hoofschu@gmail.com>
Date:   Mon Nov 12 20:36:45 2018 +0000

    Merge pull request #39 from cqframework/mih-55-dstu2-content
    
    Added DSTU2 content lists to recommendation pages ... added TOC to ho…

[33mcommit b7d6d124d10d856582c1b811cf630116fcd3cdea[m
Author: Jonathan Percival <jonathan.i.percival@gmail.com>
Date:   Thu Nov 1 16:44:20 2018 -0600

    Format descriptions for  Opioid Rec 8 correctly

[33mcommit 97ba756809c62051d198dd745d0c403a4756781a[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Fri Oct 26 12:30:30 2018 -0600

    Added DSTU2 content lists to recommendation pages ... added TOC to home and rec pages as well

[33mcommit 330552a9811808639a27847811ad7e5eda4647a7[m
Merge: 6e657e9 99ad875
Author: c-schuler <hoofschu@gmail.com>
Date:   Thu Oct 25 10:56:33 2018 -0600

    Merge pull request #37 from cqframework/mih-71-terminology-documentation
    
    Adding terminology documentation regarding maintenance to terminology…

[33mcommit 99ad875cf4be914374af2144330dc58ac053e106[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Oct 25 10:52:57 2018 -0600

    Adding terminology documentation regarding maintenance to terminology page and as comment extensions for ValueSet resources

[33mcommit 6e657e9b51cd3fd3156a412113e111ac90936628[m
Merge: bcd693e 4797943
Author: c-schuler <hoofschu@gmail.com>
Date:   Thu Oct 25 10:12:44 2018 -0600

    Merge pull request #36 from cqframework/MIH-56_AddPlanDefinitions
    
    PlanDefinition references in all Recommendation CQL files

[33mcommit 4797943ad85757d7fc185afb26e9855387ca1127[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Oct 25 10:11:55 2018 -0600

    Fixing broken links

[33mcommit 188f11f7f06a7af24c3f554d5da19705b1bc0723[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Oct 25 10:05:56 2018 -0600

    Fixing PlanDefinition references ... removing references from DSTU2 CQL as FHIR DSTU2 doesn't have a PlanDefinition

[33mcommit d5212cf3e21af4fa751c74dfd88815cec2ae87cf[m
Author: Gretchen Toups <gdt827@gmail.com>
Date:   Tue Oct 16 12:29:53 2018 -0500

    Updated all recommendation CQL with PlanDefinition references in comments

[33mcommit bcd693e5accd80aaa784c1897485617737f3399f[m
Merge: 14d74d7 5f24111
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Oct 16 09:59:26 2018 -0600

    Merge pull request #24 from cqframework/mih-47
    
    MIH-47

[33mcommit 5f241111360a81f99dd9cf40a70171235f7be21b[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 16:43:24 2018 -0600

    Removed unused UserID parameter from recommendation 5

[33mcommit 3d08eabdbe846a155b1366f13d893a638952ae1b[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 16:27:50 2018 -0600

    Accounting for seconds and weeks in common library GetPeriodDays function

[33mcommit ca3bdb93ae7899ffdf183e69e9318226dbc26ff1[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 16:11:41 2018 -0600

    Removed unused valuesets from common libraries

[33mcommit 312ad5d3e8fc943399513992e3707512f483d23d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 16:00:34 2018 -0600

    Bumped OMTKData version

[33mcommit 33e702b6f309ffff39d1c415c69a86be000c3fc1[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 15:43:41 2018 -0600

    Added error to omtk logic libraries when unit is unknown ... updated Library resources

[33mcommit a5936469cdac3a427ae89ea997da251461dd8644[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 15:26:21 2018 -0600

    Removed unnecessary comment from the OMTKLogic-0.1.0 cql

[33mcommit 2c4d99f253c468f065c934b47258aa2c69d76293[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 15:25:37 2018 -0600

    Added link to OMTKLogic modelinfo in recommendation pages

[33mcommit 6ad4df15482a9c994ed8913ddc7721f5dd77adf2[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Oct 10 15:10:45 2018 -0600

    Fixed cdc guideline url

[33mcommit 14d74d7e4781a3d42c4c633a67080300a77131f2[m
Merge: 1fc2031 a355018
Author: c-schuler <hoofschu@gmail.com>
Date:   Wed Sep 26 11:32:44 2018 -0600

    Merge pull request #22 from cqframework/MIH-46_ApplyOpioidFeedback
    
    MIH-46 Apply Opioid feedback

[33mcommit a3550184945658f23e399f021452989c6c7a5ede[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Sep 25 07:54:22 2018 -0600

    Added headers for terminology

[33mcommit f3bf6a8dc45547ce892d3c59236e9c3a38892456[m
Author: Gretchen Toups <gdt827@gmail.com>
Date:   Tue Sep 25 08:14:52 2018 -0500

    Additional modifications per feedback

[33mcommit 1fc2031e1cfbd2cc2a5e7efc352d47d50e8be999[m
Merge: 6737f69 b96576c
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Thu Sep 20 16:20:50 2018 -0600

    Merge pull request #18 from cqframework/MIH-46_ApplyOpioidFeedback
    
    Fixed typos and other obvious errors

[33mcommit b96576cfc94d4f98817f84d5feb915fae7d64594[m
Author: Gretchen Toups <gdt827@gmail.com>
Date:   Thu Sep 20 17:01:46 2018 -0500

    Fixed typos and other obvious errors

[33mcommit 6737f698a256bb8d2d4adffaf8bae1f9381f3149[m
Merge: 611a9cb 6d20f13
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed Sep 12 14:29:53 2018 -0600

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit 611a9cb6351e7f59e502a42991b83b796d263351[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed Sep 12 14:29:40 2018 -0600

    QA fixes

[33mcommit 6d20f1362991c7adfe033974f307d75c38d28b93[m
Merge: 9c86c1b 9956521
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Sep 11 20:41:08 2018 -0600

    Merge pull request #2 from muldis/dd_RxSig
    
    Issue #1 - add new pure CQL library RxSig for parsing free text SIGs, translated from a Java version

[33mcommit 9c86c1b3dac8defa0f19c1e64f8f52d363669ced[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Sep 11 15:18:48 2018 -0600

    Publishing QA

[33mcommit adf9dad8f99ae3c08bd08303e5864199c55ef173[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Sep 11 11:58:19 2018 -0600

    Added scope rationale to the process discussion.

[33mcommit ca28abf85436af836bec51f6f0ffa173fe26fd23[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Sep 11 10:08:58 2018 -0600

    Added decision point documentation and updated all service and implementation documentation.

[33mcommit ac2db8960cdea060b67d0878d7e9f0638cbab334[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Sep 10 21:54:31 2018 -0600

    Changed canonical URL;updated logo;updated guideline links

[33mcommit 10d1deae820475987a9776041ba585451d3c2b2a[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Sep 10 16:33:38 2018 -0600

    Updating build tooling

[33mcommit 63826dd2b67ddbd21c1012e44ace60aeea32a8ec[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Fri Aug 24 01:18:32 2018 -0600

    Updated publisher jar ... fixed paths ... removed duplicate license field ... corrected element ordering in valuesets

[33mcommit d204a3d7037d7ddf0c75c5abfe2a8f0db8bdede3[m
Merge: d706148 026f3ea
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Aug 21 16:45:43 2018 -0600

    Merge branch 'master' of https://github.com/cqframework/opioid-cds
    
    # Conflicts:
    #       ig.json
    #       org.hl7.fhir.igpublisher.jar

[33mcommit d70614889682d2a234bad9ee6633fbdf51c34343[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Tue Aug 21 16:43:07 2018 -0600

    Updating to latest publisher.
    Fixing valueset extension information.

[33mcommit 026f3ea8b45d80930a683e00fb8e93fdc7a6541a[m
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Aug 21 16:34:57 2018 -0600

    Update README.md

[33mcommit 305e55dadb18d4174a26a7d5d3470dbdb034a123[m
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Tue Aug 21 16:23:20 2018 -0600

    Updated readme and guideline link

[33mcommit 9956521b7a08f065f15d00b6ee718ac1ddd6253b[m
Author: Darren Duncan <darren@DarrenDuncan.net>
Date:   Mon Aug 13 21:35:45 2018 -0700

    Issue #1 - revert addition of index.html entry for library RxSig

[33mcommit 61dcf68e6166232fadd0564f7b5f4d0a3bbb68f8[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun May 13 23:38:16 2018 -0600

    Added license field to control

[33mcommit 2ec41f3894056248273aea93ed435b7aa9b7e4d1[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun May 13 23:32:33 2018 -0600

    Added changes from Ken to service-documentation

[33mcommit b25073db33b6f5e7c6ccaed1ec58b12462c527c6[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue May 1 22:39:46 2018 -0600

    Fixed potential bug in recommendation 10 output - updated elm and artifacts ... updated terminology link labels to reflect latest changes

[33mcommit 582d6962df7845c28228db60a3cd46ee23304198[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 30 16:44:41 2018 -0600

    Fixed plandefinitions with incorrect ids

[33mcommit 288a9c75bbf1de20ae8d447db7a2af8aa8682a5c[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 30 12:50:53 2018 -0600

    Updated cds hooks requests and plandefintions as a result of testing edits

[33mcommit 90c5a70113fe1a980915b2be90b33b6374afb999[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Apr 28 00:22:22 2018 -0600

    Fixes for issues #3, #4, #5, #6, #7, #8, and #9 ... updated elm, cql, and artifacts and test data

[33mcommit 545049edd07a21d74d2561d17fca374a63cd53be[m
Merge: 4c616e6 e2714e8
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed Apr 25 09:01:00 2018 -0600

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit 4c616e662d5dd239c825f81a5dc2d2827785cf42[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed Apr 25 08:58:30 2018 -0600

    Copy editing
    Updated qualityOfEvidence to match guideline recommendation statements (Evidence Type 4: Very Low)

[33mcommit e2714e8093dc340e9e9b69a240e2355b6da888b6[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Apr 24 17:26:51 2018 -0600

    Populated valueset extensions, made name machine-friendly, and added version

[33mcommit 3e8087851a0797fba4992a936b1eb9cb02a2961e[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Apr 24 16:05:56 2018 -0600

    Added inclusion and exclusion extensions to ValueSet ... populating extensions for ambulatory abuse opioids ValueSet

[33mcommit 269e692345c6b6a5b62dede893a6d0a3bcb71b57[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Apr 24 14:31:57 2018 -0600

    Fixed valueset query extension uri's in snapshot table

[33mcommit 8eef54a1f515361e05b7df4103fe125a8870219d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Apr 24 12:24:59 2018 -0600

    Added ActivityDefinition for risk assessment request ... updated PlanDefinitions ... updated Library meta data

[33mcommit bd76b6a2a56daffcd2640c1b43b8845a7d8bd1dd[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 23 18:25:21 2018 -0600

    Added meta data for valuesets

[33mcommit 77a1b9a74b182bf4a110dacd1d3d9bf5f8d181a8[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 23 17:16:36 2018 -0600

    Updated benzodiazepine, eol conditions, drug screening, naloxone, and substance abuse valuesets

[33mcommit 83734e2262ca58b39ac7c6d40173bc4ca0115428[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Apr 22 22:07:16 2018 -0600

    Refactored the valueset query extension to include description and language elements

[33mcommit a6789ae93ed63d243729e84c0f7a7cab2891e7d0[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Apr 22 17:44:07 2018 -0600

    Updating valuesets - low hanging fruit ... added end of life care and updated discharge to hospice, hospice procedure, hospice finding, and opioid abuse assessment

[33mcommit d546274b7d701a8adee782eca66833431e312ad5[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Fri Apr 20 01:05:16 2018 -0600

    Fixed table of contents and some case edits

[33mcommit b9abd4fa493f15f7af29567f5b5917a77a13fb0c[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Apr 19 17:15:25 2018 -0600

    Added ValueSet.compose.tql-query extension - giving an error that doesn't seem to cause any issues with the tables or rendering of structure definition for the extension

[33mcommit 020889b65ab6cc43c0b3d625fe58ae94ccb7cf4d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Apr 19 14:31:11 2018 -0600

    Adding artifacts for new omtk CQL ... changing snomed code in recommendation 7 test data

[33mcommit cf7c6532bfa0bf861cb33cad19d0e39a2846c06c[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Apr 19 12:27:32 2018 -0600

    Creating page for each recommendation and referencing from home ... updating process diagrams

[33mcommit 20d58cf4f4ae60865b6f3b54106a2a3788a05b85[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Apr 19 10:23:43 2018 -0600

    Restoring comments for SQL and OMTK scripting.

[33mcommit 84b2dff1702355ad4b08e4d54df124fc4408dc60[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 16 12:28:47 2018 -0600

    Added process logic and diagrams for recommendations 7, 8, and 11 - updated 10

[33mcommit 1be2110fe4d683ce1b3d13c0c3da1963ee19b119[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 16 10:55:09 2018 -0600

    Adding recommendation 4 to process documentation and updating recommendation 5

[33mcommit ca59a2dcdfe6094160df217c178ccb1bfdedbb15[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Apr 15 18:16:42 2018 -0600

    Added new terminology ... updated artifacts, cql, elm, and publisher jar

[33mcommit b1bbc2ee3e7be1da8b9c50de4cdbd02da77f45f0[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed Apr 11 14:00:28 2018 -0600

    Updated to latest terminology.
    Created SQL scripts to serialize terminology data as CQL.
    Created OMTKData library with serialized terminology data.
    Created DaysInPeriod function to enable daily mme calculation across intervals.
    Created 0.0.1 OMTKLogic that uses OMTKData.
    Created OpioidCQM logic that uses OMTKLogic 0.0.1.

[33mcommit 932a2bb8b0e8031372bf27530ead6c280b550430[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Apr 2 09:45:30 2018 -0600

    Updated publisher jar ... updated artifacts

[33mcommit 04f8b97020a1a5ea2f60510e1951860206284c08[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 26 12:01:46 2018 -0600

    Updated publisher jar ... added CDS Hooks requests to test data table

[33mcommit 88af6e3127b7816a6eef4ad8514fd36460690f99[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 26 00:56:16 2018 -0600

    Updated publisher jar ... updated test bundles, test resources, CQL, ELM, and Libraries ... removed cds hooks versioned artifacts and references

[33mcommit 2d3b74d01717eb27f8501dc5467d9f039ba4a3d5[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Mar 20 00:26:58 2018 -0600

    Updated publisher jar ... uncommented library data requirements

[33mcommit 9e37db73484214285968b0c0a0ef938f7aedc63f[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 19 17:32:42 2018 -0600

    Added stu4 cql, elm, and plan definitions that reference updated stu4 library resources

[33mcommit 0af5cdfbc867783197baea4bf0079c2a7d814862[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 19 16:14:26 2018 -0600

    Added plan definitions for new recommendations

[33mcommit 155a9f90d017f045683524f7f34b804b84f59079[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 19 02:40:14 2018 -0600

    Added stu4 library artifacts

[33mcommit 1da4741892c9fb0daa2286a9a0b5ad41a172a557[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 19 01:56:01 2018 -0600

    Added new test bundle for recommendation 11 - benzodiazepine trigger prescription

[33mcommit 12c0d28695b9b64c96b3232a4ef14e1027bd7325[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 19 01:40:35 2018 -0600

    Added new test bundle for recommendation 10 - missing prescribed opioids from urine screening

[33mcommit 807492111ece2edd6001ddb985f6d842fa87bffc[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 19 00:02:01 2018 -0600

    Added new test bundle for recommendation 8 - on benzodiazepine ... small edit to recommendation 7 risk assesment test context medication request

[33mcommit 56450a07feaa22bddf6e790c22973bd6e546ec28[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 23:35:22 2018 -0600

    Added new test bundle for recommendation 8 - MME greater than 50 mg/d

[33mcommit d7a087a5c50e5abb36d72f051d3e174a856f4f11[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 19:57:09 2018 -0600

    Added new test bundle for recommendation 7 - risk assessment procedure within past 90 days exclusion criteria (introduced new error: unable to find code 454281000124100 in http://snomed.info/sct)

[33mcommit a9f17043c9bc32f5bb6c63fdf5ed86ae46649468[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 19:43:17 2018 -0600

    Clearing up some inconsistencies in test data for recommendation 7

[33mcommit 97c5e2290769295c540b66a7cd55736bd677abfc[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 19:33:36 2018 -0600

    Added new test bundle for recommendation 7 - end of life opioid exclusion criteria

[33mcommit 10d783bdd774dd7a9553c8fd3a256ab1929c49b4[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 18:50:56 2018 -0600

    Added new test bundle for recommendation 7 - probable opioid consumption for 63 of past 90 days (meets inclusion criteria)

[33mcommit 402cfcdaaa9c71817faa2dd9091759a5b25adc02[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 18:33:16 2018 -0600

    Added new test bundle for recommendation 7 - probable opioid consumption for 6 of past 10 days (doesn't meet inclusion criteria)

[33mcommit b6436bacb576dd28b4aeb93b11b41831b91afed8[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 18:03:02 2018 -0600

    Added new test bundle for recommendation 7 - probable opioid consumption for 7 of past 10 days

[33mcommit 8aa4be543a8d1039738b893f3dc7964769d53944[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 17:37:22 2018 -0600

    Added new test bundle for recommendation 5 - MME less than 50 mg/d

[33mcommit 45d9f83943edfbec1f0d67c23595580fd472499b[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 17:29:10 2018 -0600

    Added new test bundle for recommendation 5 - MME greater than 50 mg/d

[33mcommit dc8c5464bfa7f3b59b86e0780df635df1a81f805[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 16:36:00 2018 -0600

    Added new test bundle for recommendation 4 - opioid with abuse potential in past 90 days

[33mcommit 95d2c292d5eba547716acbbf1f92fd93f36fbc64[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 16:04:10 2018 -0600

    Added new test case for recommendation 4 - not long acting opioid

[33mcommit 49b8644e35a709ff4c25368fb259bebc8608006e[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 15:18:40 2018 -0600

    Updated publisher jar

[33mcommit 82611d71f22cd5d2ba183e3f4a2b028ce41346ef[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 15:09:27 2018 -0600

    Added new recommendation definitions to scope section on home page

[33mcommit 679393a1c7078305d6f4b0387624a9e197e061af[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 14:49:28 2018 -0600

    Added STU4 plan definition artifacts for recommendations 4 and 10

[33mcommit c9f4ca5e4d9b6e07a3758fee7d2665c177a29162[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Mar 18 12:31:24 2018 -0600

    Added test bundle for recommendation 4 ... added test data to nav  ... added an example directory

[33mcommit 043cf397cb5b856746e41ad5263cff614e7f373a[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Mar 17 14:09:51 2018 -0600

    Added terminology and download sections to nav

[33mcommit eed9debcad01a44d1a0e0ee009eceb5ca3ac3614[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Mar 17 13:52:02 2018 -0600

    Updated/added Library artifacts - experiencing issue with data requirements valueSetString conversion

[33mcommit 735c2e28ff26843ccc8db20a16663c63fa99efbe[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Mar 17 02:47:43 2018 -0600

    Updated cql and elm ... added CDS Hooks versions of cql and elm

[33mcommit 6fb001bd9819e83e96aaba9583eeaa4d4b11b682[m
Author: Darren Duncan <darren@DarrenDuncan.net>
Date:   Thu Mar 15 19:15:34 2018 -0700

    Issue #1 - add index.html entry for library RxSig

[33mcommit d0448372dc57a8101a201eaed13030ab52f34ac6[m
Author: Darren Duncan <darren@DarrenDuncan.net>
Date:   Thu Mar 15 19:00:10 2018 -0700

    Issue #1 - add library resource of RxSig

[33mcommit 33c1663d8aa608f24fa3cc9a8da6eb48b1c1b182[m
Author: Darren Duncan <darren@DarrenDuncan.net>
Date:   Thu Mar 15 18:27:05 2018 -0700

    Issue #1 - add the ELM translation of RxSig.cql

[33mcommit 6d591295de7e957e6d5cdd97ae5961212f52d771[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Mon Mar 12 11:12:22 2018 -0600

    Updated publisher jar ... removed custom rxnorm codesystem fragment and updated valueset references

[33mcommit 9595c758b8cfc0841e6b85b074afc404e75090bb[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 28 17:09:27 2018 -0700

    Updated publisher jar (is building locally) ... created example tab in nav

[33mcommit 6f7b94a82e5ce6e2d991578d86f650c980f54a54[m
Author: Darren Duncan <darren@DarrenDuncan.net>
Date:   Wed Feb 28 14:52:24 2018 -0800

    Issue #1 - add new pure CQL library RxSig for parsing free text SIGs, translated from a Java version

[33mcommit bba423adbb74e6c9dde67a6a34efd574670aa0e0[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 28 11:33:09 2018 -0700

    Updated publisher jar ... Added recommendation 10 artifacts ... updated use context ... updated rxnorm codesystem ... updated recommendation artifacts ... still broken

[33mcommit 1a22eac95c10b0abc55730c6eeb065cb49bb53ad[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Feb 27 12:46:43 2018 -0700

    Added new recommendations CQL and Library artifacts ... removed DSTU2 Library and CQL - added note that conversions from DSTU2 to STU3 take place when applying PlanDefinitions in the Ruler

[33mcommit 4328d147bfc9307080496685902ccfb22a2fae0d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Feb 24 13:40:36 2018 -0700

    Added omtk rxnorm codesystem ... updated publisher jar

[33mcommit 885dbe1abb43fe9f5cd3d9249c2b7ecde243fbff[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Feb 21 20:50:28 2018 -0700

    Added OpioidCds RxNav valuesets

[33mcommit 8e2dc40090c7750674a46654794376fbf3ab6011[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Feb 18 20:01:08 2018 -0700

    Finished metadata edits ... extended and updated profiles

[33mcommit 275a58eff200da8f49de9170da018219964081f2[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Feb 15 19:32:41 2018 -0700

    Removed .idea

[33mcommit de1e71e44bc3f419945a4581de2e450f0a2fd8c8[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Feb 15 19:30:25 2018 -0700

    Correcting licensing info ... implemented cdc favicon ... first crack at complete metadata for omtk library resource

[33mcommit bab1fc2893c33238741596959efbc1fce0f1a6af[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Feb 15 13:50:26 2018 -0700

    Added creative commons attribution 4.0 license to repo and as a page in the ig (accessible from footer link instead of fhir license) - also removed empty pages from nav

[33mcommit 82ba2d312244f099a2e76eb744c59b0d353f5e7a[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Jan 28 12:08:46 2018 -0600

    Updated library artifacts

[33mcommit 495f6160d20b6e36ab5ab1d5cf858c5e7c76ff34[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sun Jan 28 11:42:31 2018 -0600

    Replaced invalid condition expression

[33mcommit 6813b9fed2ee401e57a39a24dacbdb33712585fa[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Sat Jan 27 20:54:20 2018 -0600

    Updated STU3 artifacts

[33mcommit d264fba9a527bcb525b5ce9c460be41b4cc05e7a[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Jan 23 16:41:00 2018 -0700

    Updated publisher jar and OMTK artifacts

[33mcommit 488402b41d7480eb9f3b693c729aa4f45cbe40ff[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Jan 4 13:45:15 2018 -0700

    Added artifacts for recommendation #10

[33mcommit 786302984ff93c1d171ac28281b6a72f37a4ceb4[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Thu Jan 4 12:51:13 2018 -0700

    Updated stu3 cql and elm as well as the PlanDefinition for recommendation 10

[33mcommit 7675df4f69f139e5fccbc5c6e9390c62f081deb4[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Dec 26 14:00:19 2017 -0700

    Updated cql, elm and README

[33mcommit 988572482b826399cf756015ed9fbce964f7e662[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Dec 19 18:37:23 2017 -0700

    Updated STU3 resources

[33mcommit 737c0ce4cee7889b201360d6626fe50385d45e5e[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Dec 19 17:17:16 2017 -0700

    Removed .DS_Store and added to gitignore

[33mcommit 8ed785e64a65aee5be7c075c5cb1d5c8246cac7d[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Tue Dec 19 17:13:36 2017 -0700

    Updated publisher jar ... Cleaned up styling ... Removed JSON and XML templates - links are messed up

[33mcommit db99c0aff2df9e4ee362678af0f702e9c818211e[m
Author: Chris Schuler <cschuler@myharmoniq.com>
Date:   Wed Aug 30 15:15:30 2017 -0600

    Bump build

[33mcommit 0b8aff5178d58d50d3d6841f698da3596d93b0d3[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Jul 27 16:28:50 2017 -0600

    Fixed incorrect recommendation number in the intro documentation.

[33mcommit 33a0c5927824dd9e8e19e91c02cd935464f30586[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri Jun 9 14:48:56 2017 -0600

    Added output screenshot back in.

[33mcommit e0ba6f9bc7090324feca94e7b1b673ae55e49ea8[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri Jun 9 12:21:01 2017 -0600

    Removed screenshot pending approvals.

[33mcommit 45e0a8ca6698984025b4dc2e684ad060ab0fb76c[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Tue Jun 6 12:03:21 2017 -0600

    Cleanup

[33mcommit 16aa9cdc3a5fcf497e2e78de9f31473d73bd41f1[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Tue Jun 6 10:47:33 2017 -0600

    Added service documentation from UofU ... Added global table of contents (site map)

[33mcommit 126f8d017396a962ef9ebefedc7b6d09272df078[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon Jun 5 13:14:06 2017 -0600

    Added CarePlan profile and example ... fixed PlanDefinition profile bindings ... fixed broken links in documentation

[33mcommit c446681c4fa55b9e9eddbb79c87e21dcce6b68af[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 5 12:41:54 2017 -0600

    Added Getting Started topic to the main page.

[33mcommit e5c0bf23991d23f5933aa937e0e740c0b3ba4d8e[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Jun 5 10:36:50 2017 -0600

    Added process, integration, and implementation documentation.

[33mcommit 3916ef49bce3eec64ac773e3f9e07441aeaa34f6[m
Merge: 1e3ba87 1bd5420
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Sun Jun 4 23:02:56 2017 -0600

    Merge branch 'master' of https://github.com/cqframework/opioid-cds
    
    Conflicts:
            pages/cql/OpioidCDS_STU3-0.1.0.cql

[33mcommit 1e3ba872fab6ca9794fcc4a604a20c591910e5a7[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Sun Jun 4 23:00:27 2017 -0600

    Updated med period description to string logic.

[33mcommit 1bd542038317624756998b32cc7c200666ff321c[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Sun Jun 4 17:13:19 2017 -0600

    Updated stu3 opioid cql and elm

[33mcommit ab4718498c37e9e5f2352f5a3a773b34096e3a19[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Sun Jun 4 14:52:52 2017 -0600

    Added PlanDefinition profile

[33mcommit d83419bcc41af68a14987308a86d055ee77e9341[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Fri Jun 2 18:50:05 2017 -0600

    Added table of contents and some styling to documentation.html

[33mcommit 9a4ee4c55b0a1820bc6f958c8b298713889924d2[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Fri Jun 2 14:27:53 2017 -0600

    Switching back to 3.0.1

[33mcommit a52f31b399ad4f0cf10b32153a7862e13613a12d[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Thu Jun 1 11:47:59 2017 -0600

    Bumping FHIR version to 3.1.0

[33mcommit 7b16685d907628bc52aa5ad8c5709c467fd53a36[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Thu Jun 1 07:57:52 2017 -0600

    Updated publishing jar.

[33mcommit e05938fce54240a25d6e430ed346127fa3f349cc[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Wed May 31 15:47:59 2017 -0600

    Added developer documentation

[33mcommit 71922bdb1108521ba91e0965290daa1d9020c04f[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 20:53:52 2017 -0600

    Roll back ...

[33mcommit 70435f975e443fe22e710de54498113a07e820a1[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 20:38:28 2017 -0600

    Fixing some links ... trying to resolve the trailing backslash issue

[33mcommit 6fcb7185e170d5e844ce0b29df66f61abf047ef5[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 19:10:09 2017 -0600

    adding mappings and definitions templates ... fixing links

[33mcommit d83a00dfde9932bbe514c776f22eeefbef171470[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 17:27:58 2017 -0600

    Experimenting with a redirect

[33mcommit 6e80729de7003110fb82ca3dcad765090d23660b[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 16:49:56 2017 -0600

    Rolling back changes ... adding base url to header

[33mcommit a7ead73d45bc16cffbeca697e4bf313c66481f4a[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 16:34:46 2017 -0600

    Trying something with the spec in travis.yml and _runant.bat

[33mcommit 5a365b5b9429b62af6be30ed6aa1614e14dac603[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 16:07:53 2017 -0600

    Setting Dguidename to opioid-cds in _runant.bat

[33mcommit d9dfecb0e9d7f7ad8e7b7d94aee70561865e55e0[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 16:02:18 2017 -0600

    Setting Dguidename to opioid-cds in travis.yml

[33mcommit e09f595965dc63ebab865621f1f2bc74a77e3869[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 12:17:04 2017 -0600

    Rolling back that change

[33mcommit a652dbf7710559c2c66e27cf7d45a080eab656f7[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 12:03:10 2017 -0600

    Trying something with canonical base url path

[33mcommit 7de5973a2975adffcefe76019d7740c39340cb19[m
Author: Chris Schuler <chrisshculer@databaseconsultinggroup.com>
Date:   Mon May 8 10:56:34 2017 -0600

    Removed doc types from registry.html and header.html

[33mcommit 7391a8b9e9e52291b447ab70dada6414bb0b5bc6[m
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon May 8 06:57:13 2017 -0600

    Update README.md

[33mcommit 5918328bf43f9f9f0fd529779108e3928b9c7cb2[m
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon May 8 06:56:34 2017 -0600

    Update README.md

[33mcommit 1f5873d949f219bfad14f6a77930c4e2c4845f89[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri May 5 21:09:22 2017 -0600

    Overview documentation.

[33mcommit 8706033f8a98e35aa9dfa1e5f48039c4e15a114f[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri May 5 12:25:49 2017 -0600

    More header/footer cleanup.

[33mcommit e823e01178067ec91f43c04906adb53415097120[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri May 5 12:00:53 2017 -0600

    More header/footer cleanup.

[33mcommit 75fa69558f3230c425229b69416592f479039586[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Fri May 5 09:45:55 2017 -0600

    Added Libraries for DSTU2 and STU3 logic.
    Added MedicationRequest profile.
    Cleaned up headers/footers.

[33mcommit e36653201a7c613dc81f2ab9e77f74db861f77d0[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed May 3 23:13:21 2017 -0600

    Finished CDS-wrapper logic for FHIR DSTU2.

[33mcommit e7f0e9fe85242e597765c0ebd08ce692fd159894[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Wed May 3 01:47:36 2017 -0600

    Updated CQL MME calculation logic to use timing and dosage, rather than quantity and daysSupply.

[33mcommit bb378efac9d6c1789d0ad939cf4629cdfbdd5813[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon May 1 22:48:00 2017 -0600

    Added OMTK logic cql and PlanDefinition for recommendation #5.

[33mcommit 8477c39b4d8e223d66226718de0efc7021c5df66[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 15:39:03 2017 -0700

    Style fixes.

[33mcommit 83acaaf44c951a40664de4b16250e9858b6c5b53[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 15:34:39 2017 -0700

    Style fixes.

[33mcommit 3977ab4394886f8a1cbf732cd7afba5ec6d5570e[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 14:30:46 2017 -0700

    Fixing content links.

[33mcommit 9c4b48c7f1cf4108b62b1285f051262be45be912[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 14:18:11 2017 -0700

    Footer updates

[33mcommit 8b074f2133919b1f2cc5ecdda929ff7e17870bf4[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 14:11:24 2017 -0700

    Footer changes.

[33mcommit 5848ee8793ea38f8275c83b2d9d16042791bda1f[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 14:10:44 2017 -0700

    Header and footer changes.

[33mcommit f1eae79e9924c3ce386c430885f8eca10c80acfb[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 13:52:19 2017 -0700

    Header and footer changes.

[33mcommit a19db841e91e04438b2dc5acb19b34049f94b7b2[m
Merge: a031d52 8e195e1
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 13:20:28 2017 -0700

    Merge branch 'master' of https://github.com/cqframework/opioid-cds

[33mcommit a031d52f9ed447c8e0d5e116faf40671b7148bf8[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 13 13:20:10 2017 -0700

    Updating titles and links.

[33mcommit 8e195e1124e375bfe8c2251439915021d67833b4[m
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Feb 6 09:40:01 2017 -0700

    Update README.md

[33mcommit 821764a813f15f6d9d2cf17400ff462b878d92cd[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 6 09:37:27 2017 -0700

    Fixing ig namespace.

[33mcommit 20abb1772d7f11a1bec3b86ac7fc02229f793f15[m
Author: Bryn Rhodes <bryn@databaseconsultinggroup.com>
Date:   Mon Feb 6 09:21:17 2017 -0700

    Initial commit of IG

[33mcommit b4418ff8a5c6bdfd70639adccdfc61fb33e89eca[m
Author: Bryn Rhodes <brynrhodes@users.noreply.github.com>
Date:   Mon Feb 6 09:08:58 2017 -0700

    Initial commit
