#!/usr/bin/env bash

set -e

INSTALL_DIR="$HOME/.git-shortcuts"
SHELL_RC="$HOME/.bashrc"

echo "Installing Git Shortcuts..."

mkdir -p "$INSTALL_DIR"
cp git-shortcuts.sh "$INSTALL_DIR/"

# Avoid duplicate sourcing
if ! grep -q "git-shortcuts.sh" "$SHELL_RC"; then
    echo "" >> "$SHELL_RC"
    echo "# Git Shortcuts" >> "$SHELL_RC"
    echo "source $INSTALL_DIR/git-shortcuts.sh" >> "$SHELL_RC"
fi

echo "✔ Installed successfully"
echo "Restart your shell or run: source ~/.bashrc"
echo "Then you can use Git Shortcuts commands like 'gs', 'gc', 'p', etc."
echo "For more information, visit: https://github.com/fasakinhenry/git-shortcuts"
echo "Made with ❤ by Henry Fasakin"
