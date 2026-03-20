#!/bin/bash
# CabbageOS First-Login Welcome & Setup Script

TRIGGER_FILE="$HOME/.run_cabbage_welcome"
AUTOSTART_FILE="$HOME/.config/autostart/cabbage-welcome.desktop"

# Only run if the trigger file exists
if [ ! -f "$TRIGGER_FILE" ]; then
    exit 0
fi

sleep 5

clear
echo -e "\033[1;32mWelcome to CabbageOS!\033[0m"
echo "--------------------------------"
echo "Finalizing your environment..."

if command -v tailscale &> /dev/null; then
    echo "Setting up Tailscale..."
    sudo tailscale set --operator="$USER" 2>/dev/null || true
    echo "Tailscale is ready. Run 'sudo tailscale up' to login."
fi

# 2. Sync Dotfiles (Optional check)
if [ -d "$HOME/dotfiles" ]; then
    echo "Dotfiles are linked and ready."
fi

echo "--------------------------------"
echo "Cleaning up setup triggers..."

rm -f "$TRIGGER_FILE"
rm -f "$AUTOSTART_FILE"

echo "Setup complete! Enjoy your CabbageOS experience."
echo "Press any key to close this terminal."
read -n 1
