#!/usr/bin/env bash

# =========================
# Git Shortcuts Toolkit
# =========================

# Get current branch safely
__git_current_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

# -------------------------
# Core commands
# -------------------------

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

# Status (short)
gs() {
    git status -sb
}

# Pretty log
gl() {
    git log --oneline --graph --decorate -10
}

# -------------------------
# Branch-aware push
# -------------------------

p() {
    local branch
    branch="$(__git_current_branch)"

    if [ -z "$branch" ]; then
        echo "Not on a branch."
        return 1
    fi

    git push -u origin "$branch"
}

# Pull current branch
pl() {
    git pull
}

# -------------------------
# Branch management
# -------------------------

# Create and switch to new branch
gnew() {
    if [ -z "$1" ]; then
        echo "Usage: gnew branch-name"
        return 1
    fi
    git checkout -b "$1"
}

# -------------------------
# Safe undo
# -------------------------

# Undo last commit but keep changes staged
gundo() {
    echo "Undoing last commit (keeping changes staged)..."
    git reset --soft HEAD~1
}

# -------------------------
# Manual
# -------------------------

githelp() {
    cat <<'EOF'

Git Shortcuts Toolkit
====================

Core:
-----
a                   → git add .
gc "message"        → git commit -m "message"
gs                  → git status -sb
gl                  → git log (pretty)

Branch-aware:
-------------
p                   → git push -u origin <current-branch>
pl                  → git pull

Branches:
---------
gnew branch-name    → create & switch branch

Undo:
-----
gundo               → undo last commit (safe, keeps changes staged)

Examples:
---------
a
gc "Finish CS50 Week 1"
p

EOF
}
