#!/usr/bin/env fish

# Contrary to bash, non interactive shell reads this config file
if not status is-interactive
  exit 0
end

# Tricky tricky
# If we didn't pass through the common configuration path
# we execute bash (in bootstrap fish mode) which will do so
if not set -q CROSS_SHELL_CONF_LOADED
  set -lx BOOTSTRAP_FISH '' # Telling bash to bootstrap fish
  if status is-login
    exec bash -l
  else
    exec bash
  end
end

#
# Fish shell specific conf
#
fish_vi_key_bindings
#fish_default_key_bindings

# Use starship if available
if test -r ~/.local/bin/starship
  eval (~/.local/bin/starship init fish)
end

# Use navi if available
if test -r ~/.local/bin/navi
  navi widget fish | source
  echo " 🧚‍♀️ navi is active: CTRL-R or CTRL-' 🧚‍♂️ "
end

# Completion uv if available
if test -r ~/.local/bin/navi
  uv generate-shell-completion fish | source
end

# Completion asdf if available
if test -r ~/.local/bin/asdf
  asdf completion fish | source
  
  # ASDF configuration code
  if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
  else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
  end

  # Do not use fish_add_path (added in Fish 3.2) because it
  # potentially changes the order of items in PATH
  if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
  end
  set --erase _asdf_shims
end

# See ~/.config/fish/functions/fish_user_key_bindings.fish for handling keybindings

## Abbreviations
abbr -a paci sudo pacman -S
abbr -a pacs pacman -Ss
abbr -a yaync yay --noconfirm
abbr -a apti sudo apt-get install
abbr -a aptu "sudo apt update && sudo apt upgrade"
abbr -a acs apt-cache search
abbr -a as apt search
abbr -a l ls -CF

abbr -a g git

abbr -a s sudo

abbr -a gw ./gradlew

abbr -a p podman
abbr -a d docker
abbr -a kc kubectl
abbr -a h helm

abbr -a dsw docker swarm
abbr -a dst docker stack
abbr -a ds docker service
abbr -a dse docker service
abbr -a dself docker service logs -f --tail=10 

abbr -a dc docker compose
#abbr -a dcud docker compose up -d
abbr -a dcud docker compose up -d --build --force-recreate
abbr -a dcd docker compose down --remove-orphans
abbr -a dclf docker compose logs -f --tail=10

abbr -a dea direnv allow
abbr -a dee vim .envrc

abbr -a mysql mysql --protocol=tcp

abbr ave ansible-vault edit

set -g fish_escape_delay_ms 10

#
abbr -a rvenv 'rm -rf .venv && uv venv && . .venv/bin/activate.fish && uv pip install --upgrade pip'
abbr -a venv '. .venv/bin/activate.fish'

# direnv
direnv hook fish | source

# Charge les configuration spécifiques au poste pour le shell fish
set HOSTNAME (cat /etc/hostname)
switch "$HOSTNAME"
  case "CR7H3M3"
    . $HOME/.local/cross_fish_conf.CR7H3M3.fish
  case "thinker"
    . $HOME/.local/cross_fish_conf.thinker.fish
end
