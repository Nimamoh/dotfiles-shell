#!/usr/bin/env fish

# WSL specific
# Now in /etc/profile.d/set-display.sh
export HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
export DISPLAY=$HOST_IP:0.0

export EDITOR="vim"
export VISUAL="code --wait"
#export BROWSER=firefox
# export BROWSER=microsoft-edge
export BROWSER="'/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'"

### Various check and sugar
if timeout 0.5 pgrep docker >/dev/null 2>&1; then # grep the process instead of calling docker directly for speed
  printf >&2 "%-50s" " Docker is started"
  echo >&2 -e "✅"
else
  printf >&2 "%-50s" " Docker is stopped"
  echo >&2 -e "❌"
fi

echo "" # Empty line


set PATH $PATH $HOME/.local/bin
