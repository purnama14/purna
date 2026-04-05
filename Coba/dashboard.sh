#!/bin/bash

# ==============================================================================
# Dashboard Bot Web Stealth (TUI)
# ==============================================================================

CONFIG_FILE="config.sh"

# Load current config
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo "Error: config.sh not found!"
    exit 1
fi

FUNCTION_MAIN_MENU() {
    CHOICE=$(whiptail --title "BOT STEALH DASHBOARD" --menu "Pilih Pengaturan:" 15 60 7 \
        "1" "Ubah Target URL" \
        "2" "Ubah Koordinat Klik (Tasks)" \
        "3" "Ubah Durasi Tonton (Min/Max)" \
        "4" "Alat Bantu Intip Koordinat (Helper)" \
        "5" "Pengaturan VPN (Rotasi)" \
        "6" "Mulai Bot (24 Jam Non-Stop)" \
        "7" "Keluar" 3>&1 1>&2 2>&3)

    case $CHOICE in
        1) FUNCTION_SET_URL ;;
        2) FUNCTION_SET_TASKS ;;
        3) FUNCTION_SET_DURATION ;;
        4) FUNCTION_COORD_HELPER ;;
        5) FUNCTION_SET_VPN ;;
        6) FUNCTION_RUN_BOT ;;
        7) exit 0 ;;
    esac
}

FUNCTION_SET_URL() {
    NEW_URL=$(whiptail --title "Target URL" --inputbox "Masukkan Link Website Anda:" 10 60 "$TARGET_URL" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        sed -i "s|TARGET_URL=.*|TARGET_URL=\"$NEW_URL\"|" "$CONFIG_FILE"
        TARGET_URL="$NEW_URL"
    fi
    FUNCTION_MAIN_MENU
}

FUNCTION_SET_DURATION() {
    NEW_MIN=$(whiptail --title "Durasi Minimal" --inputbox "Minimal Detik (Angka):" 10 60 "$VIEW_TIME_MIN" 3>&1 1>&2 2>&3)
    NEW_MAX=$(whiptail --title "Durasi Maksimal" --inputbox "Maksimal Detik (Angka):" 10 60 "$VIEW_TIME_MAX" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        sed -i "s/VIEW_TIME_MIN=.*/VIEW_TIME_MIN=$NEW_MIN/" "$CONFIG_FILE"
        sed -i "s/VIEW_TIME_MAX=.*/VIEW_TIME_MAX=$NEW_MAX/" "$CONFIG_FILE"
        source "$CONFIG_FILE"
    fi
    FUNCTION_MAIN_MENU
}

FUNCTION_SET_TASKS() {
    NEW_TASKS=$(whiptail --title "Koordinat Klik" --inputbox "Format: X,Y,Delay|X,Y,Delay\nContoh: 500,600,5|800,900,10" 10 60 "$TASKS" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        sed -i "s/TASKS=.*/TASKS=\"$NEW_TASKS\"/" "$CONFIG_FILE"
        TASKS="$NEW_TASKS"
    fi
    FUNCTION_MAIN_MENU
}

FUNCTION_COORD_HELPER() {
    whiptail --title "Bantuan Koordinat" --msgbox "Klik OK, lalu arahkan mouse ke target di RDP.\nPosisi mouse akan tampil di pojok kiri atas selama 10 detik." 10 60
    timeout 10s bash -c "while true; do xdotool getmouselocation | sed 's/ window:.*//'; sleep 0.5; done"
    FUNCTION_MAIN_MENU
}

FUNCTION_SET_VPN() {
    NEW_VPN=$(whiptail --title "Rotasi VPN" --inputbox "List server (contoh: best US UK Germany):" 10 60 "$VPN_LOCATIONS" 3>&1 1>&2 2>&3)
    if [ $? -eq 0 ]; then
        sed -i "s/VPN_LOCATIONS=.*/VPN_LOCATIONS=\"$NEW_VPN\"/" "$CONFIG_FILE"
        VPN_LOCATIONS="$NEW_VPN"
    fi
    FUNCTION_MAIN_MENU
}

FUNCTION_RUN_BOT() {
    if (whiptail --title "Konfirmasi" --yesno "Bot akan berjalan 24 jam non-stop.\nPastikan VPN sudah login.\nMulai sekarang?" 10 60); then
        clear
        bash bot.sh
    else
        FUNCTION_MAIN_MENU
    fi
}

# Start here
FUNCTION_MAIN_MENU
