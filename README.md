# Git Shortcuts Toolkit

> Made with ❤️ for developers by [Fasakin Henry](https://github.com/fasakinhenry)

![Version](https://img.shields.io/github/v/tag/fasakinhenry/git-shortcuts?style=for-the-badge&labelColor=gray)
![License](https://img.shields.io/github/license/fasakinhenry/git-shortcuts?style=for-the-badge)
![Shell](https://img.shields.io/badge/shell-bash%20%7C%20zsh%20%7C%20fish-blue?style=for-the-badge)

## Table of Contents

- [Overview](#overview)
- [Installation (one command)](#installation-one-command)
- [Commands](#commands)
  - [Core Commands](#core-commands)
  - [Branch Management](#branch-management)
  - [Push / Pull](#push--pull)
  - [Undo / Fix](#undo--fix)
  - [Meta / Utility](#meta--utility)
- [Example Workflow](#example-workflow)
- [Auto-completion](#auto-completion)
- [Uninstall](#uninstall)
- [Philosophy](#philosophy)
- [License](#license)

## Overview

A lightweight, cross-shell Git productivity toolkit that standardizes common Git workflows into simple, memorable commands.

Works out of the box on:

- Linux
- WSL
- macOS
- Git Bash (Windows)

Supports:

- Bash
- Zsh
- Fish

## Installation (one command)

```bash
curl -fsSL https://github.com/fasakinhenry/git-shortcuts/raw/main/install.sh | bash
```

Restart your terminal after installation.

## Commands

### Core Commands

| Command        | Description                         |
| -------------- | ----------------------------------- |
| `a`            | Stage all changes (`git add .`)     |
| `gc "message"` | Commit with message                 |
| `gs`           | Short status                        |
| `gl`           | Pretty log (graph, last 10 commits) |

### Branch Management

| Command            | Description                                 |
| ------------------ | ------------------------------------------- |
| `gnew branch-name` | Create and switch to a new branch           |
| `gclean`           | Delete local branches already merged (safe) |

### Push / Pull

| Command | Description                          |
| ------- | ------------------------------------ |
| `p`     | Push current branch and set upstream |
| `pl`    | Pull current branch                  |

### Undo / Fix

| Command | Description                             |
| ------- | --------------------------------------- |
| `gundo` | Undo last commit (keeps changes staged) |
| `gfix`  | Amend last commit                       |

### Meta / Utility

| Command    | Description                      |
| ---------- | -------------------------------- |
| `gversion` | Show toolkit version             |
| `gupdate`  | Update toolkit to latest version |
| `githelp`  | Show built-in manual             |

## Example Workflow

```bash
a
gc "Finish CS50 Week 1"
p
```

## Auto-completion

Auto-completion is enabled automatically for:

* Bash
* Zsh
* Fish

Commands will tab-complete after installation.

## Uninstall

```bash
rm -rf ~/.git-shortcuts
```

Then remove the sourcing lines from your shell configuration file:

* `~/.bashrc`
* `~/.zshrc`
* `~/.config/fish/functions`

## Philosophy

* Minimal and predictable
* Safe defaults
* No overrides of core Git commands
* Designed for learning, CS50, and real-world development

## License

MIT License
