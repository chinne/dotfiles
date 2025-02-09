#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Update system
sudo apt update && sudo apt upgrade -y

# Install common dependencies
sudo apt install -y curl wget gpg software-properties-common

# Install Starship
if ! command_exists starship; then
    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh -s -- -y
else
    echo "Starship is already installed."
fi

# Install eza
if ! command_exists eza; then
    echo "Installing eza..."
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza
else
    echo "eza is already installed."
fi

# Install latest stable Neovim
if ! command_exists nvim; then
    echo "Installing latest stable Neovim..."
    sudo add-apt-repository ppa:neovim-ppa/stable -y
    sudo apt update
    sudo apt install -y neovim
else
    echo "Neovim is already installed. Updating to latest stable version..."
    sudo apt update
    sudo apt install --only-upgrade neovim
fi

# Create SSH key
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "Creating SSH key..."
    ssh-keygen -t ed25519 -C "$(whoami)@$(hostname)" -f ~/.ssh/id_ed25519 -N ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    echo "SSH key created and added to ssh-agent."
    echo "Your public SSH key is:"
    cat ~/.ssh/id_ed25519.pub
else
    echo "SSH key already exists."
fi

echo "Installation and setup complete!"
echo "Please restart your terminal or source your shell configuration file to apply changes."
