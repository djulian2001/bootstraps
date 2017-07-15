
ansible all -i hosts -u vagrant -k -m ping

ansible all -i hosts -u vagrant -k -a "grep os_deployer /etc/group"