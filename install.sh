#!/usr/bin/env bash
set -e

REPO_URL="https://github.com/fasakinhenry/git-shortcuts.git"
INSTALL_DIR="$HOME/.git-shortcuts"

echo "Installing Git Shortcuts Toolkit..."

# Clone or update safely
if [ -d "$INSTALL_DIR/.git" ]; then
    echo "Updating existing installation..."
    git -C "$INSTALL_DIR" pull --quiet
else
    echo "Cloning repository..."
    git clone --depth=1 "$REPO_URL" "$INSTALL_DIR"
fi

# Detect shell
if [ -n "$ZSH_VERSION" ]; then
    RC_FILE="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    RC_FILE="$HOME/.bashrc"
else
    RC_FILE="$HOME/.bashrc"
fi

# Source scripts only once
if ! grep -q "git-shortcuts.sh" "$RC_FILE" 2>/dev/null; then
    echo "" >> "$RC_FILE"
    echo "# Git Shortcuts Toolkit" >> "$RC_FILE"
    echo "source \"$INSTALL_DIR/git-shortcuts.sh\"" >> "$RC_FILE"
    echo "source \"$INSTALL_DIR/completion.bash\"" >> "$RC_FILE"
fi

# Fish shell support
if command -v fish >/dev/null 2>&1; then
    mkdir -p "$HOME/.config/fish/functions"
    cp "$INSTALL_DIR/git-shortcuts.fish" "$HOME/.config/fish/functions/"
fi

echo "✔ Installation complete"
echo "Restart your terminal or run:"
echo "=========================="
echo "source $RC_FILE"
echo "=========================="
echo "Version: 1.1.0"
echo "For more information, visit: https://github.com/fasakinhenry/git-shortcuts"
echo "You can also run 'githelp' after restarting your shell to see available commands."
echo "Made with ❤ by Henry Fasakin"
