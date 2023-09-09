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

# Load asdf if available
function loadasdf
  set -l src_script ~/.asdf/asdf.fish
  set -l completion_script_target ~/.asdf/completions/asdf.fish
  set -l completion_script_link_name ~/.config/fish/completions/asdf.fish

  if test -r $src_script
    source $src_script
  end

  # Completions
  if not test -r $completion_script_link_name; and test -r $completion_script_target
    ln -s "$completion_script_target" "$completion_script_link_name" 
  end
end
loadasdf

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
abbr -a dcud docker compose up -d
abbr -a dclf docker compose logs -f --tail=10

abbr -a dea direnv allow

abbr -a mysql mysql --protocol=tcp

set -g fish_escape_delay_ms 10

#
abbr -a venv 'python -m venv .venv && . .venv/bin/activate.fish && pip install --upgrade pip'

# direnv
direnv hook fish | source

# Charge les configuration spécifiques au poste pour le shell fish
switch (hostname)
  case "CR7H3M3"
    . $HOME/.local/cross_fish_conf.CR7H3M3.fish
end