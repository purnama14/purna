#!/bin/bash


echo "[3] Install Chrome 127..."
sudo dpkg -i chrome127.deb
sudo apt -f install -y

echo "[4] Prevent Chrome from auto-updating..."
sudo bash -c 'cat > /etc/apt/preferences.d/no-upgrade-chrome <<EOF
Package: google-chrome-stable
Pin: version 127.*
Pin-Priority: 1001
EOF'

echo "[5] Done! Current Chrome version:"
google-chrome-stable --version
