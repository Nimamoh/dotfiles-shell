#!/usr/bin/env fish

# WSL specific
export EDITOR="vim"
#export VISUAL="my_code --wait"
export VISUAL="vim"
#export BROWSER=firefox
# export BROWSER=microsoft-edge
export BROWSER="'/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe'"

### Start docker automatically - Disabled for now
#dockerd_pidf="/var/run/docker.pid"

#if [ ! -e "$dockerd_pidf" ]; then
#  printf >&2 "%-50s" " Starting docker..."
#  echo >&2 -e ""
#  nohup sudo dockerd &> /tmp/dockerd.log &
#  sleep 1
#fi

#if [ -e "$dockerd_pidf" ]; then
#  printf >&2 "%-50s" " Docker is started"
#  echo >&2 -e "✅"
#else
#  printf >&2 "%-50s" " Docker is stopped"
#  echo >&2 -e "❌"
#fi

#echo "" # Empty line



set PATH $PATH $HOME/.local/bin
export ASDF_DATA_DIR="/home/rog/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
