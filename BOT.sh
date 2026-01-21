#!/bin/bash
# Konfigurasi
# Daftar URL Game (Bot akan pilih acak salah satu setiap sesi)
TARGET_URLS=(
    "https://sgames.org/cybervoid-drifter/"
    "https://sgames.org/cyber-defense-v2/"
    "https://sgames.org/emoji-survivor-neon-arena/"
)
DURATION_MIN=30  # Durasi minimal di website (detik)
DURATION_MAX=60  # Durasi maksimal di website (detik)
# Fungsi pilih URL acak
get_random_url() {
    echo "${TARGET_URLS[RANDOM % ${#TARGET_URLS[@]}]}"
}
# Fungsi untuk mendapatkan durasi random
get_random_duration() {
    echo $(( ( RANDOM % (DURATION_MAX - DURATION_MIN + 1) ) + DURATION_MIN ))
}
# Konfigurasi Visual (PATH ke file gambar yang harus dicari)
# Pastikan Anda menyimpan potongan gambar tombol "Play" dan tombol "X" (Close Ad) di folder yang sama
IMG_PLAY_1="play_button1.png" # Gambar tombol Play tipe 1 (hijau polos)
IMG_PLAY_2="play_button2.png" # Gambar tombol Play tipe 2 (hijau text)
IMG_CLOSE_AD="close_ad.png"   # Gambar tombol X untuk close banner
# Fungsi Auto-Install Dependencies
install_dependencies() {
    echo "[Setup] Memeriksa kelengkapan aplikasi..."
    
    local TO_INSTALL=""
    
    # Cek Tool Helper
    if ! command -v xdotool &> /dev/null; then TO_INSTALL="$TO_INSTALL xdotool"; fi
    if ! command -v visgrep &> /dev/null; then TO_INSTALL="$TO_INSTALL xautomation"; fi
    if ! command -v scrot &> /dev/null; then TO_INSTALL="$TO_INSTALL scrot"; fi
    
    if [ -n "$TO_INSTALL" ]; then
        echo "[Setup] Menginstall tool tambahan:$TO_INSTALL..."
        sudo apt update
        sudo apt install -y $TO_INSTALL
    fi
    
    # Cek & Install Chrome jika belum ada
    if ! command -v google-chrome &> /dev/null && ! command -v google-chrome-stable &> /dev/null; then
        echo "[Setup] Google Chrome tidak ditemukan. Mengunduh & Menginstall..."
        wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo apt install -y ./google-chrome-stable_current_amd64.deb
        rm google-chrome-stable_current_amd64.deb
        BROWSER="google-chrome-stable"
    else
        # Set browser variable
        if command -v google-chrome &> /dev/null; then BROWSER="google-chrome"; else BROWSER="google-chrome-stable"; fi
    fi
    
    echo "[Setup] Semua siap!"
}
# Jalankan Instalasi
install_dependencies
# Fungsi Cari dan Klik Gambar
click_image_if_found() {
    local img_name=$1
    local description=$2
    
    # Ambil screenshot layar saat ini
    scrot /tmp/current_screen.png
    
    # Cari gambar referensi di dalam screenshot
    # visgrep return output: x y index
    local coords=$(visgrep /tmp/current_screen.png "$img_name" 2>/dev/null)
    
    if [ -n "$coords" ]; then
        # Ambil koordinat pertama
        local x=$(echo $coords | awk '{print $1}')
        local y=$(echo $coords | awk '{print $2}')
        
        # Tambahkan sedikit offset agar klik di tengah gambar (misal +20 pixel)
        x=$((x + 20))
        y=$((y + 10))
        
        echo "   [Visual] Menemukan $description di $x,$y. Klik!"
        xdotool mousemove $x $y click 1
        return 0 # Success
    else
        return 1 # Not found
    fi
}
echo "=== Bot Traffic & Gaming Simulation (Smart Visual) Started ==="
echo "Target: ${#TARGET_URLS[@]} Website dalam rotasi"
echo "Mode: Auto-Detect Play Button & Ads"
echo "Pastikan gambar referensi ($IMG_PLAY_1, dll) ada di folder ini!"
echo "Tekan CTRL+C untuk berhenti."
echo "============================================================"
while true; do
    echo ""
    echo "[Session] Membuka browser baru..."
    CURRENT_URL=$(get_random_url)
    # Buka browser incognito di background
    # Menggunakan flag standar Chromium/Chrome + no-sandbox untuk support root user
    $BROWSER --incognito --new-window --no-sandbox --disable-gpu "$CURRENT_URL" &
    
    # Tunggu loading awal
    echo "[Session] Loading page (10s)..."
    sleep 10
    
    # Loop interaksi visual selama durasi sesi
    SESSION_DURATION=$(get_random_duration)
    END_TIME=$(( $(date +%s) + SESSION_DURATION ))
    
    echo "[Session] Mulai monitoring visual selama $SESSION_DURATION detik..."
    
    while [ $(date +%s) -lt $END_TIME ]; do
        ACTION_TAKEN=0
        
        # 1. Cek Iklan Banner (Tombol Close/X)
        if click_image_if_found "$IMG_CLOSE_AD" "Close Ad Banner"; then
            ACTION_TAKEN=1
            sleep 2
        fi
        
        # 2. Cek Tombol Play
        if [ $ACTION_TAKEN -eq 0 ]; then
            if click_image_if_found "$IMG_PLAY_1" "Play Button 1"; then
                ACTION_TAKEN=1
                sleep 5 # Tunggu game load setelah klik play
            elif click_image_if_found "$IMG_PLAY_2" "Play Button 2"; then
                ACTION_TAKEN=1
                sleep 5
            fi
        fi
        
        # 3. Jika tidak ada tombol ditemukan, asumsi:
        #    - Game sedang jalan -> Lakukan random scroll/keys
        #    - Atau Iklan Video (tidak ada tombol) -> Bot hanya menunggu (pass)
        if [ $ACTION_TAKEN -eq 0 ]; then
            echo "   [Status] Tidak ada tombol terdeteksi. Simulasi user aktif / Tunggu Iklan Video..."
            
            # Scroll sesekali untuk terlihat aktif
            if [ $((RANDOM % 5)) -eq 0 ]; then
               xdotool key Down
            fi
            
            # Main game key (Space)
            if [ $((RANDOM % 10)) -lt 2 ]; then
               xdotool key space
            fi
        fi
        
        sleep 3 # Cek setiap 3 detik
    done
    
    echo "[Session] Menutup browser..."
    pkill -f "$BROWSER"
    echo "[Session] Istirahat..."
    sleep $(( ( RANDOM % 5 ) + 3 ))
done
