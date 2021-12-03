# Alex's dotfiles
Development environment for any apt-based linux distro (Ubuntu, Debian, etc).
Using ansible for the whole installation, plus a small bootstrap script (install.sh).

## Included roles
- Git: Installs git if needed, along a minimal global gitconfig and gitignore.
- Apt: Installs base packages.

## Installation

```bash
$ git clone git@github.com:alexrolopez/dotfiles ~/.dotfiles

# 1st time, 0 requirements setup:
$ GIT_USER_NAME="My Name" GIT_USER_EMAIL="my_email@example.com" ~/.dotfiles/install.sh

# Subsequent times it is enough to run:
$ ~/.dotfiles/install.sh
```

## Inspiration
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb (https://github.com/kespinola/dotfiles)
- https://snow-dev.com/posts/next-level-dotfiles-with-ansible.html 
- https://github.com/alexdesousa/dotfiles
