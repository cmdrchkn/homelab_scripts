# Update System
sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y;
sudo apt install -y uidmap

# Install Docker
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh

# Add current user to docker group
sudo usermod -aG docker $USER

# rootless install
dockerd-rootless-setuptool.sh install
sudo loginctl enable-linger $USER

# Local env setup
sudo mkdir /opt/docker
sudo chown $USER -R /opt/docker
sudo chgrp docker -R /opt/docker

# Test docker
sudo docker run hello-world
