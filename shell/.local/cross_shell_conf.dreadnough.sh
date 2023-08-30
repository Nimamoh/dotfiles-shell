#!/usr/bin/env bash

# WSL specific
# Now in /etc/profile.d/set-display.sh
#export HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
#export DISPLAY=$HOST_IP:0.0

export EDITOR="vim"
export VISUAL="code --wait"
#export BROWSER=firefox
# export BROWSER=microsoft-edge
export BROWSER="'/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'"

## Enable gpg and ssh relay to use gpg agent on windows along with ssh-pageant.
relay() {
  export SSH_AUTH_SOCK=$HOME/.gnupg/S.gpg-agent.ssh

  local relayScript
  relayScript="$HOME/.local/bin/win-gpg-agent-relay"
  export WINGPGAGENT_DIR="/mnt/f/win-gpg-agent"
  export WINGPGAGENT_SOCKETS_WINDIR="F:/win-gpg-agent/gnupg"
  printf >&2 "%-50s" " Starting win-gpg-agent-relay..."
  if ! ($relayScript status >/dev/null 2>&1 || { timeout 1 "$relayScript" start; sleep 0.1; } >/dev/null 2>&1); then
    echo >&2 "❌"
  else
    echo >&2 "✅"
  fi
}
relay

### Mount pre-defined locations
while IFS= read -r -d '' f; do
  printf >&2 "%-50s" " Mounting $f ... "
  if ! (mountpoint "$f" >/dev/null 2>&1 || timeout 0.5 mount "$f" >/dev/null 2>&1); then
    echo >&2 -e "❌"
    continue
  else
    echo >&2 -e "✅"
  fi
done < <(find /mnt -maxdepth 1 -type d -name "*CIFS" -print0)

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