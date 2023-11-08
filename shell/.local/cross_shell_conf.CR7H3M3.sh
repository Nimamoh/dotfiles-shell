#!/usr/bin/env fish

# WSL specific
# Now in /etc/profile.d/set-display.sh
export HOST_IP=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}')
export DISPLAY=$HOST_IP:0.0

export EDITOR="vim"
export VISUAL="my_code --wait"
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
