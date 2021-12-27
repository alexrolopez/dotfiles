# Alex's dotfiles
Development environment for any apt-based linux distro (Ubuntu, Debian, etc).
Using ansible for the whole installation, plus a small bootstrap script (`install.sh`).

This setup is tailored for my specific needs, **USE AT YOUR OWN RISK**.
I recommend understanding everything first, and then bulding a setup for your specific needs, over just forking this repo.

## Included roles
- base: Installs base packages (apt packages only at the moment).
- git: Sets up a minimal global gitconfig and gitignore. **WARNING**: this will override existing global gitconfig.
- zsh: Sets zsh as default shell, installs oh-my-zsh with powerlevel10k theme.
- asdf: Installs asdf version manager.
- ruby: Installs various Ruby versions and default gems (using asdf).
- node: Installs Node versions and default npm packages (using asdf).

## Installation

```bash
$ git clone https://github.com/alexrolopez/dotfiles.git ~/.dotfiles

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
