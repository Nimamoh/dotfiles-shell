# Shell

On my machines, alot of dotfiles have to do with the shell

## Install tools

- Install git, direnv, fzf, ripgrep, fd-find
```bash
apt install mise git fzf ripgrep fd-find direnv
```


### Install optional tools

- fish

```bash
apt install fish
```

- fisher
```bash
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
```

  - fish plugins
```bash
fisher install patrickf1/colored_man_pages.fish
fisher install jethrokuan/z
fisher install jorgebucaran/autopair.fish
```

## Install

```bash
stow shell --target=$HOME
```

Then, load custom bashrc in `~/.bashrc`
```bash
. $HOME/.local/.bashrc
```

And leverage mise to download tools
```bash
mise install
```

- Configuration de Claude Code propre au poste

Le dossier `claude.HOSTNAME` (ex: `claude.CR7H3M3`) contient la configuration `~/.claude` spécifique à la machine. Une fois stow lancé sur ce paquet, créer le lien symbolique attendu par Claude Code :

```bash
stow claude.$(cat /etc/hostname) --target=$HOME
```


>  In WSL2, due to issues accessing disk, I found it wiser to disable git status from
>  starship modeline

```bash
echo "[git_status]\ndisabled = true" >> $HOME/.config/starship.toml
```


## Various configuration guide

### Various tools

```bash
apt install tldr visidata jq httpie tree
```

### Install docker from sources

[https://docs.docker.com/engine/install/binaries/#install-daemon-and-client-binaries-on-linux](https://docs.docker.com/engine/install/binaries/#install-daemon-and-client-binaries-on-linux)

[https://docs.docker.com/compose/install/linux/#install-the-plugin-manually](https://docs.docker.com/compose/install/linux/#install-the-plugin-manually)
