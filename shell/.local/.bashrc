#!/usr/bin/env bash

if [ -z "${CROSS_SHELL_CONF_LOADED+x}" ]; then
  # shellcheck disable=SC1091
  . "$HOME/.local/cross_shell_conf.sh"
fi

#    
export fish_greeting=" 🐟 Welcome in fish shell 🐟 "

if [ -n "${BOOTSTRAP_FISH+x}" ]; then
  unset BOOTSTRAP_FISH
  if shopt -q login_shell; then
    exec fish -l
  else
    exec fish
  fi
fi

#
# Bash specific configuration
#

# Bash is not bootstrapper to fish, setup bash shell from here
echo "🐚 Welcome in bash shell (This is not a fish shell!) 🐚"

## From here, fish didn't launch. Configuring bash specifics
source_if_exists() {
  local src="$1"
  if test -r "$src"; then
    # shellcheck disable=SC1090
    . "$src"
  fi
}

if test -r "$HOME/.local/bin/starship"; then
  eval "$(~/.local/bin/starship init bash)"
fi

if test -r "$HOME/.local/bin/uv"; then
  eval "$(uv generate-shell-completion bash)"
fi

if test -r "$HOME/.local/bin/navi"; then
  # shellcheck disable=SC1090
  source <(navi widget bash)
fi

if test -r "$HOME/.local/bin/asdf"; then
  export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
  source <(asdf completion bash)
fi

# fzf keybindings
source_if_exists "/usr/share/fzf/key-bindings.bash"
source_if_exists "/usr/share/fzf/completion.bash"
source_if_exists "/usr/share/doc/fzf/examples/key-bindings.bash"
source_if_exists "/usr/share/doc/fzf/examples/completion.bash"

# skim keybindings and completions
source_if_exists "/usr/share/skim/key-bindings.bash"
source_if_exists "/usr/share/skim/completion.bash"
