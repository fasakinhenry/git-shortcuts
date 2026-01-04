#!/usr/bin/env bash

set -e

REPO_URL="https://github.com/YOUR_USERNAME/git-shortcuts"
INSTALL_DIR="$HOME/.git-shortcuts"

# Detect shell
if [ -n "$ZSH_VERSION" ]; then
    RC_FILE="$HOME/.zshrc"
else
    RC_FILE="$HOME/.bashrc"
fi

echo "Installing Git Shortcuts Toolkit..."
echo "Shell config: $RC_FILE"

mkdir -p "$INSTALL_DIR"

curl -fsSL "$REPO_URL/raw/main/git-shortcuts.sh" -o "$INSTALL_DIR/git-shortcuts.sh"

chmod +x "$INSTALL_DIR/git-shortcuts.sh"

# Source only once
if ! grep -q "git-shortcuts.sh" "$RC_FILE"; then
    echo "" >> "$RC_FILE"
    echo "# Git Shortcuts Toolkit" >> "$RC_FILE"
    echo "source \"$INSTALL_DIR/git-shortcuts.sh\"" >> "$RC_FILE"
fi

echo "✔ Installed successfully"
echo "Restart your shell or run:"
echo "source $RC_FILE"
echo "For more information, visit: https://github.com/fasakinhenry/git-shortcuts"
echo "Made with ❤ by Henry Fasakin"
