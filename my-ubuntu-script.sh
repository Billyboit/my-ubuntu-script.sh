#!/bin/bash

# Update package list and upgrade installed packages
apt update && apt upgrade -y

# Install necessary packages (you can add more as needed)
apt install -y wget curl vim

# Prompt for banner message and domain
read -p "Enter banner message: " banner
read -p "Enter your domain (subdomain): " domain

# Set the banner message for SSH login
echo "$banner" | tee /etc/issue.net
echo "Banner /etc/issue.net" | tee -a /etc/ssh/sshd_config
systemctl restart sshd

# Apply the domain (if needed for web server, email, etc.)
echo "Your domain is set to: $domain"

# Example: For a web server setup (e.g., Nginx)
# You could configure the domain here. Uncomment the below lines if you're installing Nginx:
# apt install -y nginx
# tee /etc/nginx/sites-available/default <<EOF
# server {
#     listen 80;
#     server_name $domain;
#     root /var/www/html;
#     index index.html;
# }
# EOF
# systemctl restart nginx

# (Optional) You can add any other custom setups like firewall, etc.
# ufw allow OpenSSH
# ufw enable

# Clean up unnecessary packages
apt autoremove -y

echo "Script execution completed. Banner and domain are configured."
