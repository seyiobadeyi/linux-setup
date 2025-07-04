#!/bin/bash

echo "Starting Ubuntu setup..."

# Exit if any command fails
set -e

# Update & Upgrade
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Base Essentials
echo "Installing basic essentials..."
sudo apt install -y build-essential curl wget git unzip zip software-properties-common apt-transport-https ca-certificates gnupg lsb-release

# GNOME Tweaks & Customization
echo "Installing GUI tools..."
sudo apt install -y gnome-tweaks gnome-shell-extensions dconf-editor

# System Monitoring & Cleanup
echo "Installing system tools..."
sudo apt install -y htop neofetch ncdu bleachbit

# Network Tools
echo "Installing network tools..."
sudo apt install -y net-tools nmap traceroute speedtest-cli ufw gufw

# Development Tools
echo "Installing development tools..."
sudo apt install -y git vim nano tmux gcc g++ make cmake python3 python3-pip nodejs npm openjdk-17-jdk

# Optional Dev: Docker, DBs
echo "Installing optional dev tools..."
sudo apt install -y docker.io docker-compose postgresql sqlite3 mongodb-compass

# Browsers
echo "Installing Google Chrome..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install -y ./google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb

# Media Tools
echo "Installing media tools..."
sudo apt install -y ubuntu-restricted-extras vlc ffmpeg gimp obs-studio

# Office Tools
echo "Installing office apps..."
sudo apt install -y libreoffice okular evince

# Security
echo "Installing security tools..."
sudo apt install -y gufw clamav clamtk

# Archive Formats
echo "Installing archive format tools..."
sudo apt install -y p7zip-full p7zip-rar rar unrar

# Fonts & Themes
echo "Installing fonts and themes..."
sudo apt install -y fonts-firacode fonts-roboto fonts-ubuntu papirus-icon-theme

# Dropbox
echo "Installing Dropbox..."
sudo apt install -y nautilus-dropbox

# GitHub CLI
echo "Installing GitHub CLI..."
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install -y gh

# Snap & Flatpak
echo "Installing Snap and Flatpak..."
sudo apt install -y snapd flatpak gnome-software-plugin-flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Shell & Oh My Zsh
echo "Installing ZSH and Oh My Zsh..."
sudo apt install -y zsh fonts-powerline
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew (for Linux)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# NVM
echo "Installing NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Done
echo "Ubuntu setup completed. You may need to reboot for some changes to take effect."
