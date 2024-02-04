
# Quelle: https://pve.proxmox.com/wiki/Install_Proxmox_VE_on_Debian_12_Bookworm

hostname --ip-address
#192.168.0.10 # should return your IP address here

su
echo "deb [arch=amd64] http://download.proxmox.com/debian/pve bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
wget https://enterprise.proxmox.com/debian/proxmox-release-bookworm.gpg -O /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg 
sha512sum /etc/apt/trusted.gpg.d/proxmox-release-bookworm.gpg 
apt update && apt full-upgrade
apt install proxmox-default-kernel
systemctl reboot

su
apt install proxmox-ve postfix open-iscsi chrony
apt remove linux-image-amd64 'linux-image-6.1*'
update-grub
apt remove os-prober
# https://192.168.0.10:8006/

rm /etc/apt/sources.list.d/pve-install-repo.list