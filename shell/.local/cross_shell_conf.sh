#!/usr/bin/env bash

export PATH=$PATH:$HOME/bin:$HOME/.local/bin

export EDITOR="vim"
export VISUAL="code --wait"

case "$HOSTNAME" in
'CRIQUET')
  # Nothin special on criquet
  . "$HOME/.local/cross_shell_conf.criquet.sh"
  ;;
'DREADNOUGH')
  # shellcheck disable=SC1091
  . "$HOME/.local/cross_shell_conf.dreadnough.sh"
  ;;
'CR7H3M3')
  # shellcheck disable=SC1091
  . "$HOME/.local/cross_shell_conf.CR7H3M3.sh"
  ;;
esac

# Flag indicating we pass through common configuration
export CROSS_SHELL_CONF_LOADED=''