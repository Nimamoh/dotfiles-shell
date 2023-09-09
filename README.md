# Shell

On my machines, alot of dotfiles have to do with the shell

## Install tools

- Install git, direnv, fzf, ripgrep, fd-find
```bash
apt install git fzf ripgrep fd-find direnv
```



- Install starship
```bash
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- --bin-dir ~/.local/bin
```

- Download executable of [navi](https://github.com/denisidoro/navi) and put it in `~/.local/bin`

### Install optional tools

- fish

```bash
apt install fish
```

- asdf

```bash
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.12.0
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