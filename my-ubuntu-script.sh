#!/bin/bash

# Update package list and upgrade installed packages
sudo apt update && sudo apt upgrade -y

# Install necessary packages (you can add more as needed)
sudo apt install -y wget curl vim

# Prompt for banner message and domain
read -p "Enter banner message: " banner
read -p "Enter your domain (subdomain): " domain

# Set the banner message for SSH login
echo "$banner" | sudo tee /etc/issue.net
echo "Banner /etc/issue.net" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd

# Apply the domain (if needed for web server, email, etc.)
echo "Your domain is set to: $domain"

# Example: For a web server setup (e.g., Nginx)
# You could configure the domain here. Uncomment the below lines if you're installing Nginx:
# sudo apt install -y nginx
# sudo tee /etc/nginx/sites-available/default <<EOF
# server {
#     listen 80;
#     server_name $domain;
#     root /var/www/html;
#     index index.html;
# }
# EOF
# sudo systemctl restart nginx

# (Optional) You can add any other custom setups like firewall, etc.
# sudo ufw allow OpenSSH
# sudo ufw enable

# Clean up unnecessary packages
sudo apt autoremove -y

echo "Script execution completed. Banner and domain are configured."
