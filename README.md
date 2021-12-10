# Alex's dotfiles
Development environment for any apt-based linux distro (Ubuntu, Debian, etc).
Using ansible for the whole installation, plus a small bootstrap script (install.sh).

This setup is tailored for my specific needs, **USE AT YOUR OWN RISK**.
I recommend understanding everything first, and then bulding a setup for your specific needs, over just forking this repo.

## Included roles
- Git: Installs git if needed, along a minimal global gitconfig and gitignore. **WARNING**: this will override existing global gitconfig.
- Base : Installs base packages (apt packages only at the moment).
- Zsh: Installs zsh shell, sets as default, installs oh-my-zsh with powerlevel10k theme.
- Asdf: Installs asdf version manager.
- Ruby: Installs various Ruby versions and default gems (using asdf).

## Installation

```bash
$ git clone git@github.com:alexrolopez/dotfiles ~/.dotfiles

# 1st time, 0 requirements setup:
$ GIT_USER_NAME="My Name" GIT_USER_EMAIL="my_email@example.com" ~/.dotfiles/install.sh

# Subsequent times it is enough to run:
$ ~/.dotfiles/install.sh
```

## TODO
- Compatibility with other systems (MacOS, yum, pacman)

## Inspiration
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb (https://github.com/kespinola/dotfiles)
- https://snow-dev.com/posts/next-level-dotfiles-with-ansible.html 
- https://github.com/alexdesousa/dotfiles
