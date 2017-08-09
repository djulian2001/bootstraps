# using module ping to ping-pong all the hosts in the inventory file hosts
ansible all -i hosts -u vagrant -k -m ping

# all hosts in inventory file hosts, grep the string os_deployer in /etc/group
ansible all -i hosts -u vagrant -k -a "grep os_deployer /etc/group"

# running the playbook from the ansible_boot_ansible directory
ansible-playbook -k -u "vagrant" booter.yaml -e "admin_user=primusdj"

# generate the passwd
openssl passwd -1 ansible   # this worked for our purpose
# OR
echo -n ansible | sha256sum | awk '{print $1}'


# More interesting ad-hoc commands:

# using the setup module to read meta-data:
# inventory file is defined in the ansible.cfg file, which is set to ./dev/hosts
ansible all -k -u vagrant -m setup										# ansible facts an expensive process to gather
ansible all -k -u vagrant -m setup -a 'filter=ansible_distribution*'    # get the os details
ansible all -k -u vagrant -m setup -a 'filter=ansible_user*'			# get the deployer user


# installing software
ansible compute -b -a "yum -y install epel-release"  	# without module yum
ansible compute -b -a "cat /etc/yum.repos.d/epel.repo"  # no enabled
ansible compute -b -a "yum -y erase epel-release"  	# without module yum
