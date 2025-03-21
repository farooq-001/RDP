#!/bin/bash

# Update package list
echo "Updating package list..."
sudo apt update

# Install XRDP
echo "Installing XRDP..."
sudo apt install -y xrdp

# Install Xfce desktop environment
echo "Installing Xfce4 desktop environment..."
sudo apt install -y xfce4 xfce4-goodies

# Set Xfce as the default session for XRDP
echo "Setting Xfce as the default session for XRDP..."
echo "xfce4-session" > ~/.xsession

# Configure XRDP to use Xfce by editing startwm.sh
echo "Configuring XRDP to use Xfce..."
sudo sed -i 's/^\. \/etc\/X11\/Xsession/startxfce4/' /etc/xrdp/startwm.sh

# Restart XRDP service
echo "Restarting XRDP service..."
sudo systemctl restart xrdp

# Enable XRDP service to start on boot
echo "Enabling XRDP to start on boot..."
sudo systemctl enable xrdp

# Allow XRDP port (3389) through firewall
echo "Configuring firewall to allow XRDP port 3389..."
sudo ufw allow 3389/tcp

# Check the status of XRDP service
echo "Checking XRDP service status..."
sudo systemctl status xrdp

echo "Installation complete! You can now connect via RDP."
