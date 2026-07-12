#!/usr/bin/env bash

export EDITOR="nvim"
export VISUAL="nvim"
#export BROWSER=firefox
# export BROWSER=microsoft-edge
# export BROWSER="'/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'"
#

# For reading ssh key from yubikey
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

echo "" # Empty line