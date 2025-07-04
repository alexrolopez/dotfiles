# Alex's dotfiles
Development environment for macOS and any apt-based linux distro (Ubuntu, Debian, etc).
Using [ansible] for the whole installation, plus a small bootstrap script (`install.sh`).

This setup is tailored for my specific needs, **USE AT YOUR OWN RISK**.
I recommend understanding everything first, and then bulding a setup for your specific needs, over just forking this repo.

## Included roles
- base: Installs base packages (brew/apt). Installs [mise], that will be our tools version manager of choice.
- git: Sets up a minimal global gitconfig and gitignore. **WARNING**: this will override existing global gitconfig.
- zsh: Sets [zsh] as default shell, installs [oh-my-zsh] with [powerlevel10k] prompt/theme. Sets up [fzf] with [fd], and conditional [bat]/tree/file previews.
- erlang: Installs Erlang (using mise).
- elixir: Installs Elixir (using mise).
- ruby: Installs various Ruby versions and default gems (using mise).
- node: Installs Node versions and default npm packages (using mise).
- golang: Installs Go (using mise).

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

[Fira Code] nerd font is installed, it is recommended to use it as the terminal font, and to use a solarized color theme.

In Linux, you might need to alias `bat` and `fd` to `batcat` and `fdfind`, respectively.

## Inspiration
- https://medium.com/espinola-designs/manage-your-dotfiles-with-ansible-6dbedd5532bb (https://github.com/kespinola/dotfiles)
- https://snow-dev.com/posts/next-level-dotfiles-with-ansible.html 
- https://github.com/alexdesousa/dotfiles

[ansible]: https://docs.ansible.com/ansible/latest/index.html
[zsh]: https://zsh.sourceforge.io/
[oh-my-zsh]: https://github.com/ohmyzsh/ohmyzsh
[powerlevel10k]: https://github.com/romkatv/powerlevel10k
[Fira Code]: https://github.com/tonsky/FiraCode
[fzf]: https://github.com/junegunn/fzf
[fd]: https://github.com/sharkdp/fd
[bat]: https://github.com/sharkdp/bat
[mise]: https://mise.jdx.dev/
