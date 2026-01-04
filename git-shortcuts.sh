#!/usr/bin/env bash

# =========================
# Git Shortcuts Toolkit
# =========================

# Add all changes
a() {
    git add .
}

# Commit with message
gc() {
    if [ -z "$1" ]; then
        echo "Usage: gc \"commit message\""
        return 1
    fi
    git commit -m "$*"
}

# Push current branch
p() {
    git push
}

# Pull current branch
pl() {
    git pull
}

# Status (short)
gs() {
    git status -sb
}

# Log (pretty)
gl() {
    git log --oneline --graph --decorate -10
}

# Show manual
githelp() {
    cat <<'EOF'

Git Shortcuts Manual
===================

a                   → git add .
gc "message"        → git commit -m "message"
p                   → git push
pl                  → git pull
gs                  → git status -sb
gl                  → git log (pretty)

Usage examples:
---------------
a
gc "Implement hello.c"
p

EOF
}
