# AUTO175

Notes, build scripts, and associated files for the Automating BIG-IP version 17.5 course.

## Lab Numbers for versions 17.1 and 17.5

| AUTO 17.1 Number     | AUTO 17.5 Number    |
| -------------------- | ------------------- |
| ANS-C5L01-Yaml       | ANS-C5L01-YAML      |
| ANS-C5L03-Trust      | ANS-C5L03-TRUST     |
| ANS-C5L05-Playbooks  | ANS-C5L05-PLAYBOOK  |
| ANS-C5L07-InvFile    | ANS-C5L07-INVENTORY |
| ANS-C5L10-Commands   | ANS-C5L10-COMMAND   |
| ANS-C5L12-Apps       | ANS-C5L12-APP       |
| ANS-C5L14-Onboard    | ANS-C5L14-ONBOARD   |
| ANS-C5L16-HA         | ANS-C5L16-HA        |
| ANS-C5L18-Roles      | ANS-C5L18-ROLES     |
| AS3-C5L01-AutoAs3    | AS3-C5L01-AS3       |
| AS3-C6L01-DoOnboard  | AS3-C6L01-DO        |
| ICR-C2L01-Review     | ICR-C2L01-REVIEW    |
| ICR-C4L01-JsonIntro  | ICR-C4L01-JSON      |
| ICR-C4L02-IcrProgram | ICR-C4L02-PROGRAM   |
| ICR-C4L03-IcrOnboard | ICR-C4L03-ONBOARD   |

## Lab VM RAM (GB) and SCF

| Number              | bigip1 | bigip2 | jump | ubuntu1 | ubuntu2 |
| :------------------ | :----: | :----: | :--: | :-----: | :-----: |
| ANS-C5L01-YAML      |        |        |  4   |         |         |
| ANS-C5L03-TRUST     |   8    |        |  4   |    4    |    4    |
| ANS-C5L05-PLAYBOOK  |   8    |        |  4   |    4    |    4    |
| ANS-C5L07-INVENTORY |   8    |   8    |  4   |    4    |    4    |
| ANS-C5L10-COMMAND   |   8    |        |  4   |    4    |    4    |
| ANS-C5L12-APP       |   8    |        |  4   |    4    |    4    |
| ANS-C5L14-ONBOARD   |   8    |   8    |  4   |    4    |    4    |
| ANS-C5L16-LICENSE   |   8    |   8    |  4   |    4    |    4    |
| ANS-C5L18-ROLES     |   8    |   8    |  4   |    4    |    4    |
| AS3-C5L01-AS3       |   8    |        |  4   |    4    |    4    |
| AS3-C6L01-DO        |   8    |        |  4   |    4    |    4    |
| ICR-C2L01-REVIEW    |   8    |        |  4   |    4    |    4    |
| ICR-C4L01-JSON      |        |        |  4   |    4    |    4    |
| ICR-C4L02-PROGRAM   |   8    |        |  4   |    4    |    4    |
| ICR-C4L03-ONBOARD   |   8    |        |  4   |    4    |    4    |

## Lab Name, Duration (hr), Series and VLANs

| Number              | Name                                       | Duration | Series      | Mgmt | External | Internal |
| :------------------ | :----------------------------------------- | -------: | :---------- | :--: | :------: | :------: |
| ANS-C5L01-YAML      | Working with YAML                          |        1 | AUTO175-300 |  X   |    X     |          |
| ANS-C5L03-TRUST     | Building Trust                             |        1 | AUTO175-310 |  X   |    X     |          |
| ANS-C5L05-PLAYBOOK  | Writing Playbooks                          |        1 | AUTO175-320 |  X   |    X     |          |
| ANS-C5L07-INVENTORY | Inventory Files and Secure Creds           |        1 | AUTO175-330 |  X   |    X     |          |
| ANS-C5L10-COMMAND   | Using Commands and Gathering Facts         |        1 | AUTO175-340 |  X   |    X     |          |
| ANS-C5L12-APP       | Deploying and Deleting Apps                |        1 | AUTO175-350 |  X   |    X     |          |
| ANS-C5L14-ONBOARD   | Onboarding, Deprovisioning and Licensing   |        1 | AUTO175-360 |  X   |    X     |          |
| ANS-C5L16-HA        | Deploying HA                               |        1 | AUTO175-370 |  X   |    X     |          |
| ANS-C5L18-ROLES     | Understanding Ansible Roles                |        1 | AUTO175-380 |  X   |    X     |          |
| AS3-C5L01-AS3       | Automating BIG-IP with AS3                 |        4 | AUTO175-210 |  X   |    X     |          |
| AS3-C6L01-DO        | Onboarding BIG-IP with DO                  |        2 | AUTO175-200 |  X   |    X     |          |
| ICR-C2L01-REVIEW    | Reviewing BIG-IP Virtual Servers           |        1 | AUTO175-100 |  X   |    X     |          |
| ICR-C4L01-JSON      | Introduction to JavaScript Object Notation |        1 | AUTO175-110 |  X   |    X     |          |
| ICR-C4L02-PROGRAM   | Programming BIG-IP with iControl REST      |        1 | AUTO175-120 |  X   |    X     |          |
| ICR-C4L03-ONBOARD   | Onboarding BIG-IP with iControl REST       |        1 | AUTO175-130 |  X   |    X     |          |