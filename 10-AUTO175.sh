# function to determine if a specific VM exists for a given lab
#   globals: COURSE_ID, LAB_NUMBER; parameter: name of VM; returns: either "present" or "absent"
#   example: status=$(vm_status bigip1a)
#
# cannot be used until sqlite3 installed on jump, doh!
#
function vm_status() {
  vm=$1

  # sqlite3 has absolutely terrible markdown parsing, hence the sed line noise ;-)
  status=$(curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/README.md | 
    awk '/start-vm-table/,/end-vm-table/ {if ($0 !~ /-vm-table--/) {print $0}}' | 
    sed '2d; s/^| //; s/ |$//; s/  *|/|/g; s/|  */|/g' | 
    sqlite3 -cmd ".mode markdown" -cmd ".import /dev/stdin labs" -cmd ".mode tabs" \
    -cmd "SELECT CASE WHEN (SELECT $vm FROM labs WHERE Number = '$LAB_NUMBER') == '' THEN 'absent' ELSE 'present' END")

  echo -n $status
}

# confirm networking is up -- legacy from Skytap
until ping -c 1 localhost; do sleep 1; done

# change this jump box's management and external IP addresses
sudo sed --in-place 's/10\.10\.1\.30/10.10.1.29/; s/192\.168\.1\.30/192.168.1.29/' /etc/netplan/01-config.yaml
sudo netplan apply

# confirm dns is up
until dig f5.com | grep ^f5.com; do sleep 1; done

# determine if bigip1 ($3 in awk) and bigip2 ($4 in awk) are used in this lab profile
bigip1a=$(curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/README.md | 
  awk -F\| -vlab=$LAB_NUMBER 'BEGIN {bigip1a = "absent"} /Lab VM/,/Lab Name/ {gsub(/ /, "", $2); gsub(/ /, "", $3); if ($2 == lab && $3 != "") bigip1a = "present"} END {print bigip1a}')
[[ $bigip1a == present ]] && bigip1b=$(curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/README.md | 
  awk -F\| -vlab=$LAB_NUMBER 'BEGIN {bigip1b = "absent"} /Lab VM/,/Lab Name/ {gsub(/ /, "", $2); gsub(/ /, "", $4); if ($2 == lab && $4 != "") bigip1b = "present"} END {print bigip1b}')

# change bigip1's hostname to bigip1a, if bigip1a is used
if [[ $bigip1a == present ]]; then
    until $(ssh-keyscan bigip1 >/dev/null 2>&1); do sleep 1; done    # wait until bigip1 is reachable
    ssh-keyscan bigip1 >>~/.ssh/known_hosts
    sshpass -p f5trn001 ssh root@bigip1 "tmsh modify sys global-settings hostname bigip1a.f5trn.com"
fi

# download config from github, copy and load/merge it to bigip1b, if bigip1b is used
if [[ $bigip1b == present ]]; then
    until $(ssh-keyscan bigip2 >/dev/null 2>&1); do sleep 1; done    # wait until bigip2 is reachable
    curl --silent https://raw.githubusercontent.com/learnf5/AUTO175/main/bigip1b.scf --output /tmp/bigip1b.scf
    ssh-keyscan bigip2 >>~/.ssh/known_hosts
    sshpass -p f5trn002 scp /tmp/bigip1b.scf root@bigip2:/var/local/scf
    sshpass -p f5trn002 ssh -o ServerAliveInterval=1 root@bigip2 "tmsh load sys config file bigip1b.scf"   # after IP addr changes, session will hang
fi

# remove known_hosts to comply with Ansible labs
[[ $LAB_NUMBER == AUTO175-4* ]] && rm ~/.ssh/known_hosts
