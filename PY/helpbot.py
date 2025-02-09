import tkinter as tk
from tkinter import filedialog, messagebox, ttk
import threading
import time
from selenium import webdriver
from selenium.webdriver.chrome.options import Options as ChromeOptions
from selenium.webdriver.firefox.options import Options as FirefoxOptions
import psutil

class HelpBotApp:
    def __init__(self, root):
        self.root = root
        self.root.title("HELPBOT")
        self.root.geometry("600x500")

        # URL List
        self.url_label = tk.Label(root, text="URL List:")
        self.url_label.pack()
        self.url_entry = tk.Entry(root, width=50)
        self.url_entry.pack()
        self.browse_button = tk.Button(root, text="Browse", command=self.browse_file)
        self.browse_button.pack()

        # Proxy Settings
        self.proxy_label = tk.Label(root, text="Proxy (optional):")
        self.proxy_label.pack()
        self.proxy_entry = tk.Entry(root, width=50)
        self.proxy_entry.pack()

        # Browser Selection
        self.browser_label = tk.Label(root, text="Select Browser:")
        self.browser_label.pack()
        self.browser_choice = ttk.Combobox(root, values=["Chromium", "Firefox", "Headless"])
        self.browser_choice.current(0)
        self.browser_choice.pack()

        # Start and Stop Buttons
        self.start_button = tk.Button(root, text="Start", bg="green", fg="white", command=self.start_bot)
        self.start_button.pack(pady=10)
        self.stop_button = tk.Button(root, text="Stop", bg="red", fg="white", command=self.stop_bot)
        self.stop_button.pack(pady=5)

        # System Monitor
        self.monitor_label = tk.Label(root, text="System Monitor")
        self.monitor_label.pack()
        self.cpu_label = tk.Label(root, text="CPU Usage: 0%")
        self.cpu_label.pack()
        self.memory_label = tk.Label(root, text="Memory Usage: 0 MB")
        self.memory_label.pack()

        # Log Output
        self.log_output = tk.Text(root, height=10, width=70)
        self.log_output.pack(pady=10)

        self.running = False
        self.monitor_system()

    def browse_file(self):
        file_path = filedialog.askopenfilename()
        self.url_entry.insert(0, file_path)

    def start_bot(self):
        if not self.running:
            self.running = True
            self.log_output.insert(tk.END, "Bot Started...\n")
            threading.Thread(target=self.run_bot).start()
        else:
            messagebox.showinfo("Info", "Bot is already running!")

    def stop_bot(self):
        self.running = False
        self.log_output.insert(tk.END, "Bot Stopped.\n")

    def run_bot(self):
        url_file = self.url_entry.get()
        proxy = self.proxy_entry.get().strip()
        browser_type = self.browser_choice.get()

        try:
            with open(url_file, 'r') as file:
                urls = file.readlines()
        except Exception as e:
            messagebox.showerror("Error", f"Failed to read URL file: {e}")
            return

        # Setup Browser Options
        driver = self.setup_browser(browser_type, proxy)
        if driver is None:
            return

        threads = []
        for url in urls:
            if not self.running:
                break
            thread = threading.Thread(target=self.visit_url, args=(driver, url.strip()))
            thread.start()
            threads.append(thread)
            time.sleep(1)  # Delay between thread starts

        for thread in threads:
            thread.join()

        driver.quit()
        self.running = False
        self.log_output.insert(tk.END, "Bot Finished.\n")

    def setup_browser(self, browser_type, proxy):
        try:
            if browser_type == "Chromium":
                options = ChromeOptions()
                if proxy:
                    options.add_argument(f'--proxy-server={proxy}')
                driver = webdriver.Chrome(options=options)

            elif browser_type == "Firefox":
                options = FirefoxOptions()
                if proxy:
                    options.set_preference("network.proxy.type", 1)
                    options.set_preference("network.proxy.http", proxy.split(":")[0])
                    options.set_preference("network.proxy.http_port", int(proxy.split(":")[1]))
                driver = webdriver.Firefox(options=options)

            elif browser_type == "Headless":
                options = ChromeOptions()
                options.add_argument('--headless')
                if proxy:
                    options.add_argument(f'--proxy-server={proxy}')
                driver = webdriver.Chrome(options=options)
            
            return driver
        except Exception as e:
            messagebox.showerror("Error", f"Failed to start browser: {e}")
            self.running = False
            return None

    def visit_url(self, driver, url):
        if not self.running:
            return
        self.log_output.insert(tk.END, f"Visiting: {url}\n")
        try:
            driver.get(url)
            time.sleep(2)
        except Exception as e:
            self.log_output.insert(tk.END, f"Failed to visit {url}: {e}\n")

    def monitor_system(self):
        cpu_usage = psutil.cpu_percent(interval=1)
        memory_info = psutil.virtual_memory()

        self.cpu_label.config(text=f"CPU Usage: {cpu_usage}%")
        self.memory_label.config(text=f"Memory Usage: {memory_info.used // (1024 * 1024)} MB")

        self.root.after(1000, self.monitor_system)

if __name__ == "__main__":
    root = tk.Tk()
    app = HelpBotApp(root)
    root.mainloop()
