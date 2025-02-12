#!/bin/bash

# Set DEBIAN_FRONTEND to noninteractive to suppress prompts
export DEBIAN_FRONTEND=noninteractive

# Ensure script runs as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root!"
   exit 1
fi

# Ask for CRD Code (with validation)
CRD=""
while [[ -z "$CRD" ]]; do
    read -p "Paste the CRD command here: " CRD
done

# Set default username and password
default_username="user"
default_password="root"
pin="123456"

# Function to create user
create_user() {
    echo "Creating user '$default_username'..."
    
    # Create user and set password
    useradd -m -s /bin/bash "$default_username"
    echo "$default_username:$default_password" | chpasswd
    usermod -aG sudo "$default_username"

    # Set sudo to not require password
    echo "$default_username ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

    # Lock password login
    passwd -d "$default_username"
    passwd -l "$default_username"

    # Fix .bashrc PATH
    echo 'export PATH=$PATH:/home/$default_username/.local/bin' >> /home/"$default_username"/.bashrc

    echo "User '$default_username' created and configured."
}

# Function to setup extra storage
setup_storage() {
    echo "Setting up storage..."
    mkdir -p /storage
    chmod 777 /storage
    chown "$default_username":"$default_username" /storage
    mkdir -p /home/"$default_username"/storage
    mount --bind /storage /home/"$default_username"/storage
    echo "Storage setup complete."
}

# Function to install and configure RDP
setup_rdp() {
    echo "Installing dependencies..."
    apt update
    apt install -y software-properties-common
    add-apt-repository universe -y
    apt install --assume-yes xvfb xserver-xorg-video-dummy xbase-clients python3-packaging \
        python3-psutil python3-xdg libgbm1 libutempter0 libfuse2 nload qbittorrent ffmpeg \
        gpac fonts-lklug-sinhala

    echo "Installing Desktop Environment..."
    apt install --assume-yes xfce4 desktop-base xfce4-terminal xfce4-session
    echo "exec /etc/X11/Xsession /usr/bin/xfce4-session" > /etc/chrome-remote-desktop-session
    apt remove --assume-yes gnome-terminal
    apt install --assume-yes xscreensaver
    systemctl disable lightdm.service
    apt install --assume-yes dbus-x11 dbus

    echo "Installing Chrome Remote Desktop..."
    wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
    dpkg --install chrome-remote-desktop_current_amd64.deb
    apt install --assume-yes --fix-broken

    echo "Finalizing RDP setup..."
    adduser "$default_username" chrome-remote-desktop
    su - "$default_username" -c "$CRD --pin=$pin"
    service chrome-remote-desktop start

    setup_storage

    echo "RDP setup completed successfully!"
}

# Run functions
create_user
setup_rdp

# Keep the script alive
while true; do sleep 1; done
