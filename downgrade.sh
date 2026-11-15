
#!/bin/bash
# Downgrade Google Chrome to version 130 and disable auto-updates on Ubuntu
# Made by Anang Purnama :)

set -e

CHROME_VERSION="130.0.6723.91"
DEB_FILE="/tmp/google-chrome-stable_130.deb"
DEB_URL="https://gamehtml5.com/google-chrome-stable_130.0.6723.91-1_amd64.deb"

echo "=== Menghapus versi Chrome yang ada... ==="
sudo apt remove -y google-chrome-stable || true

echo "=== Mengunduh Google Chrome versi ${CHROME_VERSION}... ==="
wget -q --show-progress "$DEB_URL" -O "$DEB_FILE"

echo "=== Memeriksa paket DEB... ==="
dpkg-deb --info "$DEB_FILE" > /dev/null

echo "=== Menginstal Google Chrome versi ${CHROME_VERSION}... ==="
sudo dpkg -i "$DEB_FILE"

echo "=== Membuat preferensi untuk mengunci versi 130... ==="
sudo mkdir -p /etc/apt/preferences.d

sudo tee /etc/apt/preferences.d/google-chrome > /dev/null <<EOF
Package: google-chrome-stable
Pin: version 130.*
Pin-Priority: 1001
EOF

echo "=== Mengunci paket Chrome melalui APT Hold... ==="
sudo apt-mark hold google-chrome-stable

echo "=== Menonaktifkan repositori update otomatis Chrome... ==="
if [ -f /etc/apt/sources.list.d/google-chrome.list ]; then
    sudo mv /etc/apt/sources.list.d/google-chrome.list \
        /etc/apt/sources.list.d/google-chrome.list.disabled
fi

echo "=== Membersihkan cache... ==="
sudo apt clean

echo "=== Mengecek versi Chrome saat ini... ==="
INSTALLED_VERSION=$(google-chrome --version)

echo "$INSTALLED_VERSION"

if [[ "$INSTALLED_VERSION" == *"$CHROME_VERSION"* ]]; then
    echo "Chrome berhasil diinstal pada versi ${CHROME_VERSION}."
else
    echo "ERROR: Versi Chrome tidak sesuai target!"
    exit 1
fi

echo "=== Downgrade dan penguncian versi selesai! ==="
