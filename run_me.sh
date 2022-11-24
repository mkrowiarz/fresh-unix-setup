#!/bin/bash

# Install apt packages
sudo apt update
sudo apt upgrade
sudo apt install -y python3-pip zsh htop git curl tldr ca-certificates curl gnupg lsb-release libfuse2 tilix

# Set ZSH as default shell
sudo usermod -s /usr/bin/zsh $(whoami)

# Install snap packages
sudo snap install slack --classic
sudo snap install discord
sudo snap connect discord:system-observe
sudo snap install code --classic

# Install Antigen (ZSH plugin manager)
curl -L git.io/antigen > ~/.antigen.zsh

# Copy configuration scripts
cp .zshrc ~/.zshrc
cp .antigenrc ~/.antigenrc
cp .p10k.zsh ~/.p10k.zsh

# Install Chrome browser
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# Install docker
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Install Jetbrains Toolbox
curl -fsSL https://raw.githubusercontent.com/nagygergo/jetbrains-toolbox-install/master/jetbrains-toolbox.sh | bash

# Info for the user
echo ""
echo "EXECUTE THOSE COMMANDS AFTER REBOOT:"
echo ""
echo "sudo groupadd docker"
echo "sudo usermod -aG docker $USER"
