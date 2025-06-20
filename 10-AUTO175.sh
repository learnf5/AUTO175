# confirm networking is up
until ping -c 1 localhost; do sleep 1; done

# change this jump box's management and external IP addresses
sudo sed --in-place 's/10\.10\.1\.30/10.10.1.29/; s/192\.168\.1\.30/192.168.1.29/' /etc/netplan/01-config.yaml
sudo netplan apply

# confirm dns is up
until dig f5.com | grep ^f5.com; do sleep 1; done

# get file that will show which, if any, bigips are needed
curl --silent https://raw.githubusercontent.com/learnf5/auto/main/v17.1/dev-roster.md --output /tmp/dev-roster.md

# change bigip1's hostname to bigip1a, if bigip1a is used
###if grep "$lab_id.*bigip1a" /tmp/dev-roster.md; then
    until $(ssh-keyscan bigip1 >/dev/null 2>&1); do sleep 1; done    # wait until bigip2 is reachable
    ssh-keyscan bigip1 >>~/.ssh/known_hosts
    sshpass -p f5trn001 ssh root@bigip1 "tmsh modify sys global-settings hostname bigip1a.f5trn.com"
###fi

# download config from github, copy and load/merge it to bigip1b, if bigip1b is used
###if grep "$lab_id.*bigip1b" /tmp/dev-roster.md; then
    ###until $(ssh-keyscan bigip2 >/dev/null 2>&1); do sleep 1; done    # wait until bigip2 is reachable
    curl --silent https://raw.githubusercontent.com/learnf5/auto/main/v17.1/bigip1b.scf --output /tmp/bigip1b.scf
    ssh-keyscan bigip2 >>~/.ssh/known_hosts
    sshpass -p f5trn002 scp /tmp/bigip1b.scf root@bigip2:/var/local/scf
    sshpass -p f5trn002 ssh -o ServerAliveInterval=1 root@bigip2 "tmsh load sys config file bigip1b.scf"   # after IP addr changes, session will hang
###fi

# remove known_hosts to comply with Ansible labs
[[ $COURSE_ID == AUTO175-4* ]] && rm ~/.ssh/known_hosts

# copy snippet files from GitHub
###[[ $COURSE_ID == AUTO175-4* ]] && course=Ansible
###dir=/home/student/Documents/Automating_BIG-IP/v17.5
###mkdir --parents $dir
###curl --silent --remote-name --output-dir $dir https://raw.githubusercontent.com/learnf5/auto/main/v17.1/$course.tgz
###tar xzf $dir/$course.tgz --directory $dir
###rm $dir/$course.tgz
