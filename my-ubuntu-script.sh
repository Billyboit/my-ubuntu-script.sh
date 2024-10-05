#!/bin/bash

# Custom Ubuntu VPS Setup Script

# Update and Upgrade the system
echo "Updating and upgrading the system..."
sudo apt update -y && sudo apt upgrade -y

# Install necessary packages
echo "Installing necessary packages..."
sudo apt install -y figlet curl git ufw htop

# Enable UFW firewall and allow SSH
echo "Configuring the firewall..."
sudo ufw allow OpenSSH
sudo ufw enable

# Display firewall status
echo "Firewall status:"
sudo ufw status

# Clean up unused packages
echo "Cleaning up unused packages..."
sudo apt autoremove -y

echo "Setup complete!"