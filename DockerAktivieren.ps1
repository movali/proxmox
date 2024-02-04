sudo bash -c "apt update -y && apt upgrade -y && apt autoremove -y"
sudo curl -sSL https://get.docker.com/ | sudo sh
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version
echo $USER
sudo usermod -aG docker $USER

# Storage Drive auf vfs Umstellen
sudo vi /etc/docker/daemon.json
{ 
  "storage-driver":"vfs"
}
sudo systemctl start docker
sudo docker info | grep vfs