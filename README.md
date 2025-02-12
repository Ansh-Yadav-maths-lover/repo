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

