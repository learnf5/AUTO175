function vm_present() {
  vm=$1
  
  curl --silent https://raw.githubusercontent.com/learnf5/$COURSE_ID/main/README.md | 
    awk '/start-vm/,/end-vm/ {if ($0 !~ /-vm--/) {print $0}}' | 
    sed '2d; s/^| //; s/ |$//; s/  *|/|/g; s/|  */|/g' | 
    sqlite3 -cmd ".mode markdown" -cmd ".import /dev/stdin labs" -cmd ".mode tabs" \
    -cmd "select case when (select $vm from labs where Number = '$LAB_NUMBER') == '' then 'absent' else 'present' end"
}

bigip1=$(vm_present bigip1)
bigip2=$(vm_present bigip2)
echo bigip1: $bigip1, bigip2: $bigip2

# confirm networking is up -- legacy from Skytap
until ping -c 1 localhost; do sleep 1; done

# change this jump box's management and external IP addresses
sudo sed --in-place 's/10\.10\.1\.30/10.10.1.29/; s/192\.168\.1\.30/192.168.1.29/' /etc/netplan/01-config.yaml
sudo netplan apply

# confirm dns is up
until dig f5.com | grep ^f5.com; do sleep 1; done

# get file that will show which, if any, bigips are needed
curl --silent https://raw.githubusercontent.com/learnf5/auto/main/v17.1/dev-roster.md --output /tmp/dev-roster.md

# determine if bigip1 and bigip2 are used in this lab profile
bip1=$(curl --silent https://raw.githubusercontent.com/learnf5/AUTO175/main/README.md | 
  awk -F\| -vlab=$LAB_NUMBER 'BEGIN {bip1 = "absent"} /Lab VM/,/Lab Name/ {gsub(/ /, "", $2); gsub(/ /, "", $3); if ($2 == lab && $3 != "") bip1 = "present"} END {print bip1}')
[[ $bip1 == present ]] && bip2=$(curl --silent https://raw.githubusercontent.com/learnf5/AUTO175/main/README.md | 
  awk -F\| -vlab=$LAB_NUMBER 'BEGIN {bip2 = "absent"} /Lab VM/,/Lab Name/ {gsub(/ /, "", $2); gsub(/ /, "", $4); if ($2 == lab && $4 != "") bip2 = "present"} END {print bip2}')

# change bigip1's hostname to bigip1a, if bigip1a is used
if [[ $bip1 == present ]]; then
    until $(ssh-keyscan bigip1 >/dev/null 2>&1); do sleep 1; done    # wait until bigip1 is reachable
    ssh-keyscan bigip1 >>~/.ssh/known_hosts
    sshpass -p f5trn001 ssh root@bigip1 "tmsh modify sys global-settings hostname bigip1a.f5trn.com"
fi

# download config from github, copy and load/merge it to bigip1b, if bigip1b is used
if [[ $bip2 == present ]]; then
    until $(ssh-keyscan bigip2 >/dev/null 2>&1); do sleep 1; done    # wait until bigip2 is reachable
    curl --silent https://raw.githubusercontent.com/learnf5/AUTO175/main/bigip1b.scf --output /tmp/bigip1b.scf
    ssh-keyscan bigip2 >>~/.ssh/known_hosts
    sshpass -p f5trn002 scp /tmp/bigip1b.scf root@bigip2:/var/local/scf
    sshpass -p f5trn002 ssh -o ServerAliveInterval=1 root@bigip2 "tmsh load sys config file bigip1b.scf"   # after IP addr changes, session will hang
fi

# remove known_hosts to comply with Ansible labs
[[ $LAB_NUMBER == AUTO175-4* ]] && rm ~/.ssh/known_hosts
