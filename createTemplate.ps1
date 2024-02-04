apt update && apt upgrade
apt install sudo curl wget net-tools vim tree git locate bpytop htop screen unzip expect-dev wireguard sshpass direnv python3-pip python3-venv -y
wget https://github.com/PowerShell/PowerShell/releases/download/v7.4.1/powershell-7.4.1-linux-x64.tar.gz
bash -c 'mkdir -p /opt/microsoft/powershell/7.4.1 && tar zxf powershell-7.4.1-linux-x64.tar.gz -C /opt/microsoft/powershell/7.4.1/ && chmod +x /opt/microsoft/powershell/7.4.1/pwsh && ln -s /opt/microsoft/powershell/7.4.1/pwsh /usr/bin/pwsh'
rm powershell-7.4.1-linux-x64.tar.gz

adduser itadmin
usermod -aG sudo itadmin
echo "itadmin ALL=(ALL:ALL) ALL" >> /etc/sudoers

ssh-keygen -t ed25519 -C "6582836+movali@users.noreply.github.com"
# add github

git config --list \
&& git config --global user.name "bs18reps" \
&& git config --global user.email "98468202+bs18reps@users.noreply.github.com" \
&& git config --list \
&& git clone git@github.com:bs18reps/stdLinux.git

sudo bash -c 'echo "set number" >>  /etc/vim/vimrc'
sudo bash -c 'echo "highlight Comment ctermfg=yellow" >>  /etc/vim/vimrc'
sudo bash -c 'echo "filetype indent on" >>  /etc/vim/vimrc'
sudo bash -c 'echo "syntax on" >>  /etc/vim/vimrc'
sudo bash -c 'echo "set pastetoggle=<F2>" >>  /etc/vim/vimrc'
sudo bash -c 'echo "autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab autoindent" >>  /etc/vim/vimrc'
sudo bash -c 'cat  /home/itadmin/stdLinux/profile >> /etc/profile' 
echo "source /etc/profile" >> ~/.profile