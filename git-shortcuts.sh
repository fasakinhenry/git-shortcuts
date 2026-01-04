#!/usr/bin/env bash

# =========================
# Git Shortcuts Toolkit
# =========================

GIT_SHORTCUTS_VERSION="1.1.0"

# -------------------------
# Helpers
# -------------------------

__git_current_branch() {
    git rev-parse --abbrev-ref HEAD 2>/dev/null
}

__require_git_repo() {
    git rev-parse --git-dir >/dev/null 2>&1 || {
        echo "Not a git repository."
        return 1
    }
}

# -------------------------
# Core commands
# -------------------------

a() {
    __require_git_repo || return 1
    git add .
}

gc() {
    __require_git_repo || return 1
    [ -z "$1" ] && echo 'Usage: gc "commit message"' && return 1
    git commit -m "$*"
}

gs() {
    git status -sb
}

gl() {
    git log --oneline --graph --decorate -10
}

# -------------------------
# Push / Pull
# -------------------------

p() {
    __require_git_repo || return 1
    local branch="$(__git_current_branch)"
    git push -u origin "$branch"
}

pl() {
    git pull
}

# -------------------------
# Branch management
# -------------------------

gnew() {
    __require_git_repo || return 1
    [ -z "$1" ] && echo "Usage: gnew branch-name" && return 1
    git checkout -b "$1"
}

# Remove merged local branches (safe)
gclean() {
    __require_git_repo || return 1
    git branch --merged \
        | grep -vE '^\*|main|master|dev' \
        | xargs -r git branch -d
}

# -------------------------
# Undo / Fix
# -------------------------

# Undo last commit, keep staged
gundo() {
    __require_git_repo || return 1
    git reset --soft HEAD~1
}

# Amend last commit
gfix() {
    __require_git_repo || return 1
    git commit --amend
}

# -------------------------
# Version / Update
# -------------------------

gversion() {
    echo "Git Shortcuts Toolkit v$GIT_SHORTCUTS_VERSION"
}

gupdate() {
    local dir="$HOME/.git-shortcuts"
    echo "Updating Git Shortcuts Toolkit..."
    git -C "$dir" pull --quiet && echo "✔ Updated"
}

# -------------------------
# Help
# -------------------------

githelp() {
    cat <<'EOF'

Git Shortcuts Toolkit
====================

Core
----
a                   → git add .
gc "msg"            → commit
gs                  → status (short)
gl                  → pretty log

Branches
--------
gnew name           → create & switch branch
gclean              → delete merged local branches

Push / Pull
-----------
p                   → push current branch with upstream
pl                  → pull

Undo / Fix
----------
gundo               → undo last commit (safe)
gfix                → amend last commit

Meta
----
gversion            → show version
gupdate             → update toolkit
githelp             → show this help

EOF
}
