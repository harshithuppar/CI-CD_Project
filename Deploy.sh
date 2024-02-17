#!/bin/bash

# Define variables
REPO_URL="https://github.com/harshithuppar/CI-CD_Project.git"  
WEB_ROOT="/var/www/html"                                   
NGINX_SERVICE="nginx"                                      

# Clone the latest code from the Git repository
echo "Cloning the latest code from the repository..."
git clone $REPO_URL $WEB_ROOT

# Check if the clone operation was successful
if [ $? -eq 0 ]; then
    echo "Code successfully cloned."
else
    echo "Error: Failed to clone the code. Exiting."
    exit 1
fi

# Restart Nginx to apply the changes
echo "Restarting Nginx..."
sudo systemctl restart $NGINX_SERVICE

# Check if Nginx restart was successful
if [ $? -eq 0 ]; then
    echo "Nginx restarted successfully."
else
    echo "Error: Failed to restart Nginx. Please check Nginx logs for details."
    exit 1
fi

echo "Deployment completed successfully."
exit 0