# Dotfiles

## Features

- Screenshots (Win+Alt+4)
- Clipboard Manager (Win+Ctrl+c)
- Find Apps (Win+Space) 
- Find Scripts (Win+Ctrl+Space) 
- Find Open Windows (Win+Shift+Space) 
- Fuzzy Finder (Win+Slash) 
    -[] fine tune the fzfmenu script
- Musikcube (Win+m)


## Scripts
- wallpaper-runner 
- restart
- turnoff



First clone the repository. 

For environment specific things create a bash_env and put it there. 
```bash
cd ~/dotfiles
touch bash_env
```
This is to keep enviromnent specific things on each environment withouth bloating the file needlessly

If there's already a .bashrc or .bash_profile can be moved over

```bash
mv ~/.bashrc ~/dotfiles/bash_env
or
mv ~/.bash_profile ~/dotfiles/bash_env
```
that way whatever is in there will continue to be there.


Then we link the good stuff. 

```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/bashrc ~/.bashrc
cp ~/dotfilew/gitconfig ~/.gitconfig
ln -s ~/dotfiles/i3/config ~/.config/i3/conf
```

There are aliases to edit the files 

```bash
bashrc 
```

```bash
vimrc
```

To source the bash after updates
```bash
reload
```

## Rofi

```bash
sudo apt instal rofi
mkdir ~/.confif/rofi
ln -s ~/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
```


## Vim Stuff

Install vim plug. 
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
then
```bash
vimrc
```
then run 
```
:PlugInstall
```


## nvim
```bash
sudo apt update
sudo apt install make gcc ripgrep unzip git xclip curl

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/
```

## Git Stuff
Add this to ~/.gitconfig
```shell
[include]
    path = ~/dotfiles/gitconfig.common
```
a bit awkward, but there's value in having each computer with its own identity.
Adding commands the 'git way' to test/try out and move to gitconfig.common when/if they're ready. 

## Music config

## General updates

```shell
sudo EDITOR=vi visudo

#User privilege specification
username ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown
```


## Random notes

### Install
- feh
- i3
- rofi
- fastfetch `apt install fastfetch`
- nvim
- bumblebee-status https://github.com/tobi-wan-kenobi/bumblebee-status
- green clip, wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip
- musikcube, wget https://github.com/clangen/musikcube/releases/download/3.0.4/musikcube_3.0.4_linux_x86_64.deb 

