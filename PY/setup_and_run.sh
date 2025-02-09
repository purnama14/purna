#!/bin/bash

# Clone repository dari GitHub
git clone https://github.com/purnama14/purna/raw/refs/heads/main/PY/helpbot.py
cd helpbot

# Instal dependencies
pip install -r https://github.com/purnama14/purna/raw/refs/heads/main/PY/requirements.txt

# Instal WebDriver
sudo apt install -y chromium-browser chromium-chromedriver firefox geckodriver

# Jalankan script
python helpbot.py
