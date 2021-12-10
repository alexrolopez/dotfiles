#!/usr/bin/env bash

# Sets up the dev environment, dotfiles, etc.
# 1) Checks for the required env vars (git user name and email)
# 2) Installs ansible if needed
# 3) Executes dotfiles.yml playbook (all the roles, or optionally just tags passed as args)

set -e

function die {
  (>&2 echo -e "\\033[1;91m[FATAL] $1\\033[0;0m")
  exit 1
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

tags="${1:-all}"

if ! [ -x "$(command -v ansible)" ]; then
  sudo apt update && sudo apt install -y ansible
fi

ansible-playbook -i ~/.dotfiles/hosts ~/.dotfiles/dotfiles.yml --ask-become-pass --tags "$tags"

echo "Development environment ready! Log out and log back in for new zsh shell to take effect."
