# Alex's dotfiles
Development environment for macOS and apt-based Linux distros, with Ubuntu/Pop!_OS and Ubuntu on WSL2 as the primary Linux targets.
Using [ansible] for the whole installation, plus a small bootstrap script (`install.sh`).

This setup is tailored for my specific needs, **USE AT YOUR OWN RISK**.
I recommend understanding everything first, and then bulding a setup for your specific needs, over just forking this repo.

## Included roles
- base: Installs base packages (brew/apt). Installs [mise], that will be our tools version manager of choice.
- git: Sets up a minimal global gitconfig and gitignore. **WARNING**: this will override existing global gitconfig.
- zsh: Sets [zsh] as default shell, installs [oh-my-zsh] with [starship] prompt. Sets up [fzf] with [fd], and conditional [bat]/tree/file previews.
- erlang: Installs Erlang (using mise).
- elixir: Installs Elixir (using mise).
- ruby: Installs various Ruby versions and default gems (using mise).
- node: Installs Node versions and default npm packages (using mise).
- golang: Installs Go (using mise).
- python: Installs Python versions and upgrades pip (using mise).

## Pre-requisites

### macOS
- Xcode Command Line Tools (includes git and other basic command line tools)
- Homebrew
```bash
xcode-select --install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Linux
- git
```bash
sudo apt update
sudo apt install git
```

### Ubuntu on Windows WSL2
- Install an Ubuntu WSL2 distribution from the Microsoft Store or with `wsl --install -d Ubuntu`.
- Run this installer from inside the Linux filesystem, not from `/mnt/c/...`.
- The bootstrap script runs with Bash, but the playbook sets your Ubuntu user shell to zsh.
- The playbook enables systemd in `/etc/wsl.conf`; after the first run, restart WSL from Windows with `wsl --shutdown` and open Ubuntu again.
- Docker Engine is installed inside WSL. If you prefer Docker Desktop's WSL integration, disable or skip the Docker tasks before running this playbook.

## Installation
Create and add ssh key to github (https://github.com/settings/ssh/new), then:

```bash
git clone https://github.com/alexrolopez/dotfiles.git ~/.dotfiles # or
git clone git@github.com:alexrolopez/dotfiles.git ~/.dotfiles

# 1st time run:
GIT_USER_NAME="My Name" GIT_USER_EMAIL="my_email@example.com" ~/.dotfiles/install.sh

# Subsequent times it is enough to run:
~/.dotfiles/install.sh
```

## Post-installation
You might need to restart your terminal to see the changes.

[Fira Code] is installed for local Linux/macOS terminal apps; use a Nerd Font variant as the terminal font and a solarized color theme.

For Ubuntu on WSL2, font rendering is controlled by Windows Terminal, not by packages installed inside Ubuntu. Install `CaskaydiaCove Nerd Font Mono` on Windows and set it as the font face for the Windows Terminal Ubuntu profile.

On Linux, the shell config automatically handles distro-specific command names such as `batcat` and `fdfind`.

## Inspiration
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb (https://github.com/kespinola/dotfiles)
- https://snow-dev.com/posts/next-level-dotfiles-with-ansible.html 
- https://github.com/alexdesousa/dotfiles
- https://github.com/nateberkopec/dotfiles

[ansible]: https://docs.ansible.com/ansible/latest/index.html
[zsh]: https://zsh.sourceforge.io/
[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[starship]: https://starship.rs/
[Fira Code]: https://github.com/tonsky/FiraCode
[fzf]: https://github.com/junegunn/fzf
[fd]: https://github.com/sharkdp/fd
[bat]: https://github.com/sharkdp/bat
[mise]: https://mise.jdx.dev/
