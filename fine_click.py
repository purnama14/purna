import pyautogui
import time

# Tunggu beberapa detik untuk persiapan
print("Tunggu 5 detik...")
time.sleep(5)

# Cari posisi gambar di layar
target = pyautogui.locateCenterOnScreen('play.png', confidence=0.8)

if target:
    print(f"Gambar ditemukan di: {target}")
    pyautogui.moveTo(target)
    pyautogui.click()
else:
    print("Gambar tidak ditemukan.")
