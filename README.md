# AUTO175

Notes, build scripts, and associated files for the Automating BIG-IP version 17.5 course.

## Lab Numbers for versions 17.1 and 17.5

| Automating 17.1 Number | Automating 17.5 Number   |
| ---------------------- | ------------------------ |
| ANS-C5L01-Yaml         | AUTO175-4C5L01-YAML      |
| ANS-C5L03-Trust        | AUTO175-4C5L03-TRUST     |
| ANS-C5L05-Playbooks    | AUTO175-4C5L05-PLAYBOOK  |
| ANS-C5L07-InvFile      | AUTO175-4C5L07-INVENTORY |
| ANS-C5L10-Commands     | AUTO175-4C5L10-COMMAND   |
| ANS-C5L12-Apps         | AUTO175-4C5L12-APP       |
| ANS-C5L14-Onboard      | AUTO175-4C5L14-LICENSE   |
| ANS-C5L16-Ha           | AUTO175-4C5L16-HA        |
| ANS-C5L18-Roles        | AUTO175-4C5L18-ROLES     |
| AS3-C5L01-AutoAs3      | AUTO175-3C5L01-AS3       |
| AS3-C6L01-DoOnboard    | AUTO175-2C6L01-DO        |
| ICR-C2L01-Review       | AUTO175-1C2L01-REVIEW    |
| ICR-C4L01-JsonIntro    | AUTO175-1C4L01-JSON      |
| ICR-C4L02-IcrProgram   | AUTO175-1C4L02-PROGRAM   |
| ICR-C4L03-IcrOnboard   | AUTO175-1C4L03-ONBOARD   |

## Lab VM RAM (GB) and SC

<!--start-vm-table-->
| Number                   | bigip1a | bigip1b | jump | ubuntu1a | ubuntu1b |
| ------------------------ | :-----: | :-----: | :--: | :------: | :------: |
| AUTO175-4C5L01-YAML      |         |         |  4   |          |          |
| AUTO175-4C5L03-TRUST     |    8    |         |  4   |    4     |    4     |
| AUTO175-4C5L05-PLAYBOOK  |    8    |         |  4   |    4     |    4     |
| AUTO175-4C5L07-INVENTORY |    8    |    8    |  4   |    4     |    4     |
| AUTO175-4C5L10-COMMAND   |    8    |         |  4   |    4     |    4     |
| AUTO175-4C5L12-APP       |    8    |         |  4   |    4     |    4     |
| AUTO175-4C5L14-LICENSE   |    8    |    8    |  4   |    4     |    4     |
| AUTO175-4C5L16-HA        |    8    |    8    |  4   |    4     |    4     |
| AUTO175-4C5L18-ROLES     |    8    |    8    |  4   |    4     |    4     |
| AUTO175-3C5L01-AS3       |    8    |         |  4   |    4     |    4     |
| AUTO175-2C6L01-DO        |    8    |         |  4   |    4     |    4     |
| AUTO175-1C2L01-REVIEW    |    8    |         |  4   |    4     |    4     |
| AUTO175-1C4L01-JSON      |         |         |  4   |    4     |    4     |
| AUTO175-1C4L02-PROGRAM   |    8    |         |  4   |    4     |    4     |
| AUTO175-1C4L03-ONBOARD   |    8    |         |  4   |    4     |    4     |
<!--end-vm-table-->

## Lab Name, Duration (hr), Series and VLANs

| Number                   | Name                                       | Duration | Series      | Mgmt | External | Internal |
| ------------------------ | ------------------------------------------ | -------: | ----------- | :--: | :------: | :------: |
| AUTO175-4C5L01-YAML      | Working with YAML                          |        1 | AUTO175-400 |  X   |    X     |          |
| AUTO175-4C5L03-TRUST     | Building Trust                             |        1 | AUTO175-410 |  X   |    X     |          |
| AUTO175-4C5L05-PLAYBOOK  | Writing Playbooks                          |        1 | AUTO175-420 |  X   |    X     |          |
| AUTO175-4C5L07-INVENTORY | Inventory Files and Secure Creds           |        1 | AUTO175-430 |  X   |    X     |          |
| AUTO175-4C5L10-COMMAND   | Using Commands and Gathering Facts         |        1 | AUTO175-440 |  X   |    X     |          |
| AUTO175-4C5L12-APP       | Deploying and Deleting Apps                |        1 | AUTO175-450 |  X   |    X     |          |
| AUTO175-4C5L14-LICENSE   | Onboarding, Deprovisioning and Licensing   |        1 | AUTO175-460 |  X   |    X     |          |
| AUTO175-4C5L16-HA        | Deploying HA                               |        1 | AUTO175-470 |  X   |    X     |          |
| AUTO175-4C5L18-ROLES     | Understanding Ansible Roles                |        1 | AUTO175-480 |  X   |    X     |          |
| AUTO175-3C5L01-AS3       | Automating BIG-IP with AS3                 |        4 | AUTO175-300 |  X   |    X     |          |
| AUTO175-2C6L01-DO        | Onboarding BIG-IP with DO                  |        2 | AUTO175-200 |  X   |    X     |          |
| AUTO175-1C2L01-REVIEW    | Reviewing BIG-IP Virtual Servers           |        1 | AUTO175-100 |  X   |    X     |          |
| AUTO175-1C4L01-JSON      | Introduction to JavaScript Object Notation |        1 | AUTO175-110 |  X   |    X     |          |
| AUTO175-1C4L02-PROGRAM   | Programming BIG-IP with iControl REST      |        1 | AUTO175-120 |  X   |    X     |          |
| AUTO175-1C4L03-ONBOARD   | Onboarding BIG-IP with iControl REST       |        1 | AUTO175-130 |  X   |    X     |          |
