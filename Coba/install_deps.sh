#!/bin/bash

# ==============================================================================
# Script Instalasi Bot Web Stealth (Ubuntu RDP)
# ==============================================================================

echo "Updating system..."
sudo apt update -y

echo "Installing core tools..."
sudo apt install -y xdotool wmctrl whiptail x11-utils curl bc wget gnupg2

# Install Google Chrome
echo "Installing Google Chrome..."
if ! command -v google-chrome &> /dev/null; then
    wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/google-chrome.gpg
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list
    sudo apt update
    sudo apt install -y google-chrome-stable
fi

# Install Windscribe CLI
echo "Setting up Windscribe CLI repository..."
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key FDC247B7
echo "deb https://repo.windscribe.com/ubuntu focal main" | sudo tee /etc/apt/sources.list.d/windscribe-repo.list
sudo apt update
sudo apt install -y windscribe-cli

echo "=============================================================================="
echo "Instalasi Selesai!"
echo "Silakan login Windscribe dulu dengan: windscribe login"
echo "Lalu jalankan dashboard dengan: bash dashboard.sh"
echo "=============================================================================="
