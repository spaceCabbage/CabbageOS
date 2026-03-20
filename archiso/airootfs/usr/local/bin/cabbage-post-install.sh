#!/bin/bash
# CabbageOS Post-Install Configuration Script

USER_NAME="$1"
USER_HOME="/home/$USER_NAME"

if [ -z "$USER_NAME" ]; then
    echo "Error: No username provided."
    exit 1
fi

echo "Setting up CabbageOS dotfiles for $USER_NAME..."

sudo -u "$USER_NAME" git clone https://github.com/spaceCabbage/dotfiles.git "$USER_HOME/dotfiles"

sudo -u "$USER_NAME" ln -sf "dotfiles/terminal/.bashrc" "$USER_HOME/.bashrc"
sudo -u "$USER_NAME" ln -sf "dotfiles/terminal/.bash_aliases" "$USER_HOME/.bash_aliases"
sudo -u "$USER_NAME" ln -sf "dotfiles/terminal/.tmux.conf" "$USER_HOME/.tmux.conf"
sudo -u "$USER_NAME" mkdir -p "$USER_HOME/.config"
sudo -u "$USER_NAME" ln -sf "../dotfiles/terminal/starship.toml" "$USER_HOME/.config/starship.toml"
sudo -u "$USER_NAME" ln -sf "../dotfiles/konsole/.config/konsolerc" "$USER_HOME/.config/konsolerc"
sudo -u "$USER_NAME" ln -sf "../dotfiles/nvim" "$USER_HOME/.config/nvim"
sudo -u "$USER_NAME" mkdir -p "$USER_HOME/.local/share"
sudo -u "$USER_NAME" ln -sf "../../dotfiles/konsole/.local/share/konsole" "$USER_HOME/.local/share/konsole"

sudo -u "$USER_NAME" touch "$USER_HOME/.bashrc_local"
sudo -u "$USER_NAME" touch "$USER_HOME/.run_cabbage_welcome"

# System setup
usermod -aG docker "$USER_NAME"
systemctl enable docker.service
systemctl enable tailscaled.service

echo "CabbageOS configuration complete."
