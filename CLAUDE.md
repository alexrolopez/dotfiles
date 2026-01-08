# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is an Ansible-based dotfiles repository for automating development environment setup on macOS and Ubuntu/Debian Linux.

## Commands

### Installation
```bash
# First-time setup (requires environment variables)
GIT_USER_NAME="My Name" GIT_USER_EMAIL="my_email@example.com" ~/.dotfiles/install.sh

# Subsequent runs
~/.dotfiles/install.sh
```

### Running Specific Roles
```bash
# Run only specific roles using tags
ansible-playbook -i hosts dotfiles.yml --tags "zsh,git"

# List available tags
ansible-playbook -i hosts dotfiles.yml --list-tags
```

## Architecture

**Ansible Structure:**
- `dotfiles.yml` - Main playbook that orchestrates all roles
- `hosts` - Inventory file (configures localhost)
- `group_vars/local` - Global variables (user home, dotfiles path, git credentials)
- `roles/` - Individual configuration modules

**Roles:**
| Role | Purpose |
|------|---------|
| `base` | Core packages via Homebrew (macOS) or apt (Linux) |
| `git` | Git configuration and global gitignore |
| `zsh` | Shell setup with Oh My Zsh, plugins, Starship prompt |
| `ruby` | Ruby versions via mise |
| `node` | Node.js versions via mise |
| `golang` | Go installation via mise |
| `erlang` | Erlang installation via mise |
| `elixir` | Elixir installation via mise |

**Role Structure Pattern:**
```
roles/<name>/
├── defaults/main.yml    # Version numbers, default packages
├── tasks/main.yml       # Installation and configuration steps
├── templates/           # Jinja2 templates (e.g., gitconfig.j2)
└── files/               # Static files to copy/link
```

## Key Files

- `roles/base/tasks/main.yml` - Package lists for brew and apt
- `roles/zsh/files/zshrc` - Main shell configuration
- `roles/git/templates/gitconfig.j2` - Git config template
- `group_vars/local` - Git user credentials from environment variables

## Version Management

All language versions are managed via mise (defined in each role's `defaults/main.yml`):
- Ruby: 3.3.5, 3.2.6
- Node: 22.14.0, 18.18.0
- Go: 1.25.4
- Erlang: 27.0
- Elixir: 1.18.2-otp-27

## Platform Differences

The playbook uses `ansible_os_family` to handle platform-specific tasks:
- macOS: Uses Homebrew, installs Colima for containers
- Linux: Uses apt, adds external repos (HashiCorp, Redis, Docker), sets zsh as default shell
