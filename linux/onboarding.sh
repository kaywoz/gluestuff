#!/bin/bash

# Bash script template for software deployment

# Ask for user input
read -p "hostname? " variable0
read -p "netdata claim token? " variable1
read -p "tailscale authkey?" variable2

# Use the variables as arguments for software deployment commands
# Placeholder for deployment commands
echo "Deploying software with variables: $variable1 and $variable2..."

# Setting the hostname (requires root privileges)
echo "Setting hostname to '$variable0'..."
sudo hostnamectl set-hostname "$variable1"
echo "Hostname set to $(hostname)"

# Installing APT packages
echo "Installing necessary APT packages..."
sudo apt update && sudo apt install -y neofetch tldr mlocate python3-dev python3-pip python3-setuptools # Replace package1 and package2 with actual package names
pip3 install thefuck --user
sudo updatedb # update for mlocate

echo "APT and pip packages installed successfully."

# Running other scripts from the internet
# WARNING: Ensure that the scripts are from trusted sources to avoid security risks
echo "Downloading and executing scripts from the internet..."
curl -sSL https://raw.githubusercontent.com/kaywoz/gluestuff/main/linux/bashbits-install_netdata | sed "s/placeholder/${variable1}/g" | bash -s -- "$variable1"
curl -sSL https://raw.githubusercontent.com/kaywoz/gluestuff/main/linux/bashbits-install_tailscale | sed "s/placeholder/${variable2}/g" | bash -s -- "$variable2"
echo "Scripts executed successfully."

# Summary of actions taken and their results
echo "Summary of actions taken:"
echo "1. Software deployed using variables: $variable1 and $variable2"
echo "2. Hostname set to: $(hostname)"
echo "3. APT packages installed."
echo "4. External scripts executed."

# Note: The echo statements are placeholders for actual command outputs
# Replace them with the specific commands and log handling mechanisms you prefer
