#!/usr/bin/env bash

# Sets up the dev environment, dotfiles, etc.
# 1) Checks for the required env vars (git user name and email)
# 2) Installs ansible if needed
# 3) Executes dotfiles.yml playbook

set -e

function die {
  (>&2 echo -e "\\033[1;91m[FATAL] $1\\033[0;0m")
  exit 1
}

function is_macos {
  [[ "$(uname)" == "Darwin" ]]
}

function is_apt_based_linux {
  [[ -f /etc/debian_version ]]
}

function is_ansible_installed {
  [ -x "$(command -v ansible)" ]
}

# Check required env vars
if [ -z "${GIT_USER_NAME:=$(git config --global --get user.name)}" ]
then
  die "GIT_USER_NAME not set"
fi
if [ -z "${GIT_USER_EMAIL:=$(git config --global --get user.email)}" ]
then
  die "GIT_USER_EMAIL not set"
fi
export GIT_USER_NAME
export GIT_USER_EMAIL

# Install ansible if needed
if is_macos; then
  if ! is_ansible_installed; then
    brew install ansible
  fi
elif is_apt_based_linux; then
  if ! is_ansible_installed; then
    sudo apt update && sudo apt install -y ansible
  fi
else
  die "Unsupported platform"
fi

ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --ask-become-pass

echo "Development environment ready! Log out and log back in for new zsh shell to take effect."