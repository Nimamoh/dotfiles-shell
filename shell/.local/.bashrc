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
  local msg="$2"
  if test -r "$src"; then
    # shellcheck disable=SC1090
    . "$src"
    if [ -n "$msg" ]; then
      echo "$msg"
    fi
  fi
}

if type "mise"; then
  source <(mise activate bash)
fi

if type "starship"; then
  eval "$(starship init bash)"
fi

if type "uv"; then
  eval "$(uv generate-shell-completion bash)"
fi

if type "navi"; then
  # shellcheck disable=SC1090
  source <(navi widget bash)
  echo " 🧚‍♀️ navi is active: CTRL-G 🧚‍♂️ "
fi

if type fzf; then
  eval "$(fzf --bash)"
  echo " 🔍 fzf is active: CTRL-T (insert file), CTRL-R (search history), ALT-C (cd) 🔍 "
fi


# skim keybindings and completions
source_if_exists "/usr/share/skim/key-bindings.bash" " 🄺 skim is active: CTRL-T (insert file), CTRL-R (search history), ALT-C (cd) 🄺 "
source_if_exists "/usr/share/skim/completion.bash"
