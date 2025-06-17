#!/bin/bash

# Update package lists
sudo apt update

# Install curl and gpg
echo "Installing curl and gpg..."
sudo apt install -y curl gnupg

# Get Ubuntu version information
UBUNTU_VERSION=$(lsb_release -rs)
UBUNTU_CODENAME=$(lsb_release -cs)
echo "Detected Ubuntu $UBUNTU_VERSION ($UBUNTU_CODENAME)"

# Install the Microsoft package signing key with simplified approach
echo "Installing Microsoft package signing key..."
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

# Add Microsoft repository for the current Ubuntu version
echo "Adding Microsoft repository..."
sudo sh -c "echo 'deb [arch=amd64] https://packages.microsoft.com/ubuntu/$UBUNTU_VERSION/prod $UBUNTU_CODENAME main' > /etc/apt/sources.list.d/microsoft-prod.list"

# Update package lists again to include the new repository
sudo apt update

# Install the Intune portal
echo "Installing Intune portal..."
sudo apt install -y intune-portal

# Add Microsoft Edge repository (using the simpler approach)
echo "Adding Microsoft Edge repository..."
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/edge stable main" > /etc/apt/sources.list.d/microsoft-edge.list'
sudo apt update
sudo apt install -y microsoft-edge-stable

echo "Installation complete!"
