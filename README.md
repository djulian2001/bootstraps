bootstraps
==========
The intent is to remote bootstrap server(s).  Specific to ansible on centos 7x, at least for now.

The High Level
--------------
There are 2 parts:

First the manager or controller node needs to be setup to run ansible.  There are several ways to do this.
This bootstrap will use the pip installer to get the ansible software.

Why pip?
Pip will have the latest core modules.
Its the source code and modules behavior should follow the docs
Its very easy to do
Down the road, if ansible versions have to be coupled to deployments these specifics can be delt with using virtualenv.

Usage Requirements
------------------
Git has to be installed on the manager-controller node.
All nodea have to have SSH enabled with password authentication set to yes
All nodes need to have the same admin user with root priviledges

Installation
------------
sudo yum install git
clone the repo to a directory owned by the admin user, same user in usage requirements

Part One Usage
--------------
cd bootstraps

set the enviornment

    source init.source

run the bash shell script and follow the instructions provided
    
    bash boot_this.sh    

Part Two Usage
--------------
The playbook we will use to bootstrap the ansible user is following directory

    cd ansible_boot_ansible

setup your inventories accordingly under either [controller] or [compute]

    vi dev/hosts
    [compute]     # is remote nodes that will run the deployed services
    [controller]  # is the host ansible is running on, aka your bootstrapping from.

It would be wise to change the user being deployed password, use the hash appropriate for your system

    openssl passwd -1 password      # prepend with space to avoid history
    --the hash--
    
Add the new password hash to the vault file
    
    ansible-vault edit locker_talk.yaml
    deploy_password=--the hash--

