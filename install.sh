#!/usr/bin/env bash
set -e

REPO="https://github.com/fasakinhenry/git-shortcuts"
DIR="$HOME/.git-shortcuts"

mkdir -p "$DIR"
git clone "$REPO" "$DIR" --depth=1 2>/dev/null || git -C "$DIR" pull

if [ -n "$ZSH_VERSION" ]; then
    RC="$HOME/.zshrc"
elif [ -n "$BASH_VERSION" ]; then
    RC="$HOME/.bashrc"
fi

if [ -n "$RC" ] && ! grep -q git-shortcuts "$RC"; then
    echo "source $DIR/git-shortcuts.sh" >> "$RC"
    echo "source $DIR/completion.bash" >> "$RC"
fi

if command -v fish >/dev/null; then
    mkdir -p ~/.config/fish/functions
    cp "$DIR/git-shortcuts.fish" ~/.config/fish/functions/
fi

echo "✔ Git Shortcuts installed. Restart your shell."
echo "Version: 1.1.0"
echo "For more information, visit: https://github.com/fasakinhenry/git-shortcuts"
echo "You can also run 'githelp' after restarting your shell to see available commands."
echo "Made with ❤ by Henry Fasakin"
