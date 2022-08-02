# run
# log into host3
# download and run this script
#   curl -o - https://raw.githubusercontent.com/nickhardiman/machine-host3/main/machine-host3-configure.sh | bash -x

# SSH security
# if SSH service on this box is accessible to the Internet
# use key pairs only, disable password login
# for more information, see
#   man sshd_config
#echo "AuthenticationMethods publickey" >> /etc/ssh/sshd_config
 
# Prerequisites

# install Ansible and git
sudo dnf install --assumeyes ansible-core git

# install Ansible libvirt collection
sudo ansible-galaxy collection install community.libvirt --collections-path /usr/share/ansible/collections

# install my libvirt host role
mkdir -p ~/ansible/roles
cd ~/ansible/roles
git clone https://github.com/nickhardiman/libvirt-host.git
sudo ansible-playbook libvirt-host/tests/test.yml

# host config
cd ~/ansible
git clone https://github.com/nickhardiman/machine-host3.git
cd machine-host3
ansible-playbook --ask-become-pass machine-host3-configure.yml


