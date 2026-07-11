#!/usr/bin/env bash

# WSL specific
#
export EDITOR="vim"
export VISUAL="code --wait"
#export BROWSER=firefox
# export BROWSER=microsoft-edge
# export BROWSER="'/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'"

## Enable gpg and ssh agent
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
echo >&2 "For using your yubikey on this machine:"
echo >&2 "  From powershell admin:"
echo >&2 "  usbipd list"
echo >&2 "  usbipd attach --wsl archlinux --busid=8-1 # check it's available through lsusb"
echo >&2 "  You should be able to use smartcard as ssh key"
echo >&2

#
# Il faut mettre à jour le tty pour les confirmations pinentry
#
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye

### Various check and sugar
if timeout 0.5 pgrep docker >/dev/null 2>&1; then # grep the process instead of calling docker directly for speed
  printf >&2 "%-50s" " Docker is started"
  echo >&2 -e "✅"
else
  printf >&2 "%-50s" " Docker is stopped"
  echo >&2 -e "❌"
fi

if timeout 0.5 gpg --card-status >/dev/null 2>&1; then
  printf >&2 "%-50s" " YubiKey Smartcard is online"
  echo >&2 -e "✅"
else
  printf >&2 "%-50s" " YubiKey Smartcard is offline"
  echo >&2 -e "❌"
fi

echo "" # Empty line