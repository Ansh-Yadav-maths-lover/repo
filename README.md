**How to Install Google Chrome on Linux (XFCE Desktop)**

### **1. Download Chrome**
Run the following command in the terminal:
```bash
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
```

### **2. Install Chrome**
After downloading, install it using:
```bash
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

If you see **dependency errors**, fix them by running:
```bash
sudo apt --fix-broken install -y
```

Then re-run the installation:
```bash
sudo dpkg -i google-chrome-stable_current_amd64.deb
```

### **3. Run Google Chrome**
Once installed, you can start Chrome using:
```bash
google-chrome
```
or from **Applications Menu → Internet → Google Chrome**.

### **4. If Running on a Remote Server**
If Chrome doesn’t start due to **DISPLAY errors**, try:
```bash
export DISPLAY=:0
google-chrome
```

### **5. Optional: Make Chrome Default**
If you want to set Chrome as the default browser:
```bash
sudo update-alternatives --set x-www-browser /usr/bin/google-chrome
```

Let me know if you face any issues! 🚀


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

**How to Install and Set Firefox as Default on Linux (XFCE/Desktop/Cloud Shell)**

### **1. Check if Firefox is Installed**

Run:

```bash
ls /opt/firefox
```

If it says **No such file or directory**, Firefox is missing.

---

### **2. Reinstall Firefox Properly**

To remove any broken installation and reinstall Firefox, run:

```bash
sudo rm -rf /opt/firefox
wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/135.0/linux-x86_64/en-US/firefox-135.0.tar.xz
tar -xvf firefox-135.0.tar.xz
sudo mv firefox /opt/firefox
sudo ln -s /opt/firefox/firefox /usr/bin/firefox
```

---

### **3. Check If the File Exists and Set Executable Permission**

```bash
ls -l /opt/firefox/firefox
```

If the file exists but is not executable:

```bash
sudo chmod +x /opt/firefox/firefox
```

---

### **4. Run Firefox**

```bash
/opt/firefox/firefox
```

or simply:

```bash
firefox
```

---

### **5. Set Firefox as Default Browser**

```bash
xdg-settings set default-web-browser firefox.desktop
```

Or manually update alternatives:

```bash
sudo update-alternatives --install /usr/bin/x-www-browser x-www-browser /opt/firefox/firefox 100
sudo update-alternatives --set x-www-browser /opt/firefox/firefox
```

---

### **6. If Using Cloud Shell (Chrome OS)**

For Cloud Shell, the above method might not work. Try using Flatpak:

```bash
sudo apt update
sudo apt install flatpak -y
flatpak install flathub org.mozilla.firefox -y
flatpak run org.mozilla.firefox
```

---

### **7. Install WinRAR on Linux**

#### **Download and Extract WinRAR**

```bash
wget https://www.win-rar.com/fileadmin/winrar-versions/rarlinux-x64-701.tar.gz
tar -xvf rarlinux-x64-701.tar.gz
cd rar
sudo cp rar unrar /usr/bin/
```

#### **Verify Installation**

```bash
rar
unrar
```

---

**Let me know if you face any issues! 🚀**


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------

#### **VLC INSTALLATION**
```bash
sudo apt update
sudo apt install vlc
```
