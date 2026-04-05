#!/bin/bash

# ==============================================================================
# Konfigurasi Bot
# ==============================================================================

# URL Target
TARGET_URL="https://example.com"

# Waktu tonton (Detik) - Akan dirandom setiap sesi
VIEW_TIME_MIN=60
VIEW_TIME_MAX=180

# Daftar Tugas (Format: X,Y,Delay|X,Y,Delay)
# Contoh: "500,600,5|800,900,10"
TASKS="0,0,0"

# Pengaturan Loop
# Setel ke 0 untuk loop selamanya (non-stop)
MAX_LOOPS=0

# Lokasi VPN (Pisahkan dengan spasi)
# Gunakan 'best' untuk otomatis server terbaik, atau list seperti: 'US UK Germany'
VPN_LOCATIONS="best"

# ==============================================================================
# HANYA EDIT JIKA ANDA TAHU APA YANG ANDA LAKUKAN
# ==============================================================================
CHROME_WIDTH=1280
CHROME_HEIGHT=720
CHROME_POS_X=0
CHROME_POS_Y=0
DATA_DIR="/tmp/chrome-bot-session-$(date +%s)"
