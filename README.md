# Alex's dotfiles
Development environment for macOS and any apt-based linux distro (Ubuntu, Debian, etc).
Using [ansible] for the whole installation, plus a small bootstrap script (`install.sh`).

This setup is tailored for my specific needs, **USE AT YOUR OWN RISK**.
I recommend understanding everything first, and then bulding a setup for your specific needs, over just forking this repo.

## Included roles
- base: Installs base packages (brew/apt). Also installs [Neslo Nerd Font], and creates a postgres superuser role for the current user.
- git: Sets up a minimal global gitconfig and gitignore. **WARNING**: this will override existing global gitconfig.
- zsh: Sets [zsh] as default shell, installs [oh-my-zsh] with [powerlevel10k] theme. Sets up [fzf] with [fd], and conditional [bat]/tree/file previews.
- asdf: Installs [asdf] version manager.
- ruby: Installs various Ruby versions and default gems (using asdf).
- node: Installs Node versions and default npm packages (using asdf).

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

[Fira Code] and [Neslo Nerd Font] are installed.
It is recommended to set terminal font to Neslo Nerd Font, as powerlevel10k is already configured for that to be able to correctly display all info.

In Linux, you might need to alias `bat` and `fd` to `batcat` and `fdfind`, respectively.

## Inspiration
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb (https://github.com/kespinola/dotfiles)
- https://snow-dev.com/posts/next-level-dotfiles-with-ansible.html 
- https://github.com/alexdesousa/dotfiles

[ansible]: https://docs.ansible.com/ansible/latest/index.html
[zsh]: https://zsh.sourceforge.io/
[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[Neslo Nerd Font]: https://github.com/romkatv/powerlevel10k/blob/master/font.md
[Fira Code]: https://github.com/tonsky/FiraCode
[fzf]: https://github.com/junegunn/fzf
[fd]: https://github.com/sharkdp/fd
[bat]: https://github.com/sharkdp/bat
[asdf]: http://asdf-vm.com/
