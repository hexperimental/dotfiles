# Dotfiles

Personal dotfiles for a keyboard-driven Linux (i3wm) and macOS setup.

## Keyboard Shortcuts (i3)

| Shortcut | Action |
|---|---|
| Win+Return | Terminal (Ghostty) |
| Win+Space | App launcher (Rofi) |
| Win+Shift+Space | Window switcher |
| Win+Alt+Space | Script launcher |
| Win+Ctrl+c | Clipboard manager (GreenClip) |
| Win+Slash | Fuzzy finder |
| Win+m | Spotify (scratchpad toggle) |
| Win+Alt+4 | Screenshot (Flameshot) |
| Win+Ctrl+l | Lock screen |
| Win+f | Fullscreen toggle |
| Win+r | Resize mode |
| Win+w | Close window |

## Setup

### Clone

```bash
cd ~/
git clone http://github.com/hexperimental/dotfiles
```

### Dependencies

**Arch Linux:**
```bash
sudo pacman -S git rofi feh flameshot xorg-xrandr brightnessctl
```

**Additional tools:**
- [Bumblebee-status](https://github.com/tobi-wan-kenobi/bumblebee-status) (i3 bar)
- [GreenClip](https://github.com/erebe/greenclip/releases) (clipboard manager)
- [Ghostty](https://ghostty.org) (terminal emulator)
- [eza](https://github.com/eza-community/eza) (ls replacement, optional)

### Symlinks

```bash
# Shell
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/bash_aliases ~/dotfiles/bash_aliases  # already sourced by bashrc

# Git (copy, not symlink — edit name/email per machine)
cp ~/dotfiles/gitconfig ~/.gitconfig

# i3
mkdir -p ~/.config/i3
ln -s ~/dotfiles/i3/config ~/.config/i3/config

# Rofi
mkdir -p ~/.config/rofi
ln -s ~/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi

# Neovim
mkdir -p ~/.config/nvim
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua

# Ghostty
mkdir -p ~/.config/ghostty
ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config

# tmux
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# Vim (legacy)
ln -s ~/dotfiles/vimrc ~/.vimrc
```

### Environment-specific config

Machine-specific settings go in files that are gitignored:

```bash
touch ~/dotfiles/bash_env          # shell env vars, PATH overrides, etc.
touch ~/dotfiles/i3/config_env.conf  # i3 machine-specific (display outputs, input devices)
```

If there's an existing `.bashrc` or `.bash_profile`, move it to `bash_env` so those settings are preserved:
```bash
mv ~/.bashrc ~/dotfiles/bash_env
```

### Cross-platform notes

The shell config detects macOS vs Linux automatically. Platform-specific differences:
- `open` alias: only set to `xdg-open` on Linux (macOS keeps native `open`)
- Local IP detection: uses `ipconfig getifaddr en0` on Mac, `hostname -I` on Linux
- pyenv: works with both git-clone installs (`~/.pyenv/bin`) and Homebrew installs
- i3/rofi/greenclip configs are Linux-only
- Git prompt (`__git_ps1`): on macOS with system git, download it manually:
  ```bash
  curl -o ~/.git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
  ```

## Vim

Install [vim-plug](https://github.com/junegunn/vim-plug):
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then open vim and run `:PlugInstall`.

## Neovim

Install prerequisites:
```bash
# Arch
sudo pacman -S make gcc ripgrep unzip git xclip curl neovim

# Or install manually
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
```

The `init.lua` is based on [Kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim). Open nvim after symlinking and plugins will install automatically via lazy.nvim.

## Git

The `.gitconfig` is **copied** (not symlinked) so each machine can have its own `user.name` and `user.email`. Shared aliases and settings live in `gitconfig.common` which is included automatically.

```bash
vim ~/.gitconfig  # add name and email
```

## Shell aliases

| Alias | Action |
|---|---|
| `bashrc` | Edit bashrc in nvim |
| `vimrc` | Edit vimrc in nvim |
| `reload` | Re-source bashrc |
| `dots` | cd to ~/dotfiles |
| `notes` | cd to ~/Notes |
| `code` | cd to ~/Code |
| `ips` | Show local and public IP |
| `venv` / `mkvenv` | Activate / create Python venv |

## Scripts

Helper scripts live in `scripts/`. Make them executable once after cloning:

```bash
chmod +x ~/dotfiles/scripts/*.sh
```

### tmux-dots.sh

Starts a tmux session called `dots` with a 3-pane layout at `~/dotfiles` (two stacked panes on the left, one on the right). If the session already exists it just skips.

```bash
~/dotfiles/scripts/tmux-dots.sh
```

## Recommended utilities

- yay (AUR helper)
- fastfetch
- 1password
- syncthing
- imagemagick
- Obsidian
- Musikcube / DeadBeef
