#!/bin/bash

# Clone repository dari GitHub
git clone https://github.com/purnama14/purna/raw/refs/heads/main/PY/helpbot.py
cd helpbot

# Instal dependencies
wget https://github.com/purnama14/purna/raw/refs/heads/main/PY/requirements.txt
pip install -r requirements.txt

# Instal WebDriver
sudo apt install -y chromium-browser chromium-chromedriver firefox geckodriver

# Jalankan script
python helpbot.py
