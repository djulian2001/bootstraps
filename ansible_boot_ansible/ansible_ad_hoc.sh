
ansible all -i hosts -u vagrant -k -m ping

ansible all -i hosts -u vagrant -k -a "grep os_deployer /etc/group"


# running the playbook from the ansible_boot_ansible directory
ansible-playbook -k -u "vagrant" booter.yaml -e "admin_user=primusdj"

# generate the passwd
openssl passwd -1 ansible

# this worked for our purpose

# OR

echo -n ansible | sha256sum | awk '{print $1}'