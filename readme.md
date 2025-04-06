# Dotfiles

## Features

- Screenshots (Win+Alt+4)
- Clipboard Manager (Win+Ctrl+c)
- Find Apps (Win+Space) 
- Find Scripts (Win+Ctrl+Space) 
- Find Open Windows (Win+Shift+Space) 
- Fuzzy Finder (Win+Slash) 
    -[] fine tune the fzfmenu script
- Musikcube/DeadBeef (Win+m)
- 


## Scripts
- wallpaper-runner 
- restart
- turnoff


## Things to do

-[] Automate this nonsnse. 
To make the clipboard manager work run following: 
```bash
$/usr/bin/greenclip daemon >/dev/null 2>&1 &
```

## Setup

This whole thing is mainly for productivity and centered around keyboard control. Once the OS and i3 are installed: 

Install Git
```
sudo apt install git

or

sudo pacman -S git
```

Once git is good: 

```
cd ~/
git clone http://github.com/hexperimental/dotfiles
```

This will create a dotfiles directory. 

Now lets get some deps going first to minimize the errors


#### Quick install Deps
- Bumblebee-status https://github.com/tobi-wan-kenobi/bumblebee-status
- xorg-xrandr
- feh
- rofi
- flameshot
- GreenClip (wget https://github.com/erebe/greenclip/releases/download/v4.2/greenclip)

Once all that stuff is ready to go can plug things in. 

```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/bashrc ~/.bashrc
cp ~/dotfilew/gitconfig ~/.gitconfig
ln -s ~/dotfiles/i3/config ~/.config/i3/conf
```

Before wiring the bash settings check if there's something there already. 

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

Finally

```bash
ln -s ~/dotfiles/bashrc ~/.bashrc
```


Once that thing is plugged in i'd say restart to fully get the goodies, but can keep going. 


There are some of the goodies out of the box

To edit bashrc
```bash
bashrc 
```

To edit vimrc
```bash
vimrc
```

To source the bash/ after updates
```bash
reload
```



## Vim

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
or 
sudo pacman -S 


# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo mkdir -p /opt/nvim-linux-x86_64
sudo chmod a+rX /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/

```

Then to make it easy: 
```
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
``` 

Open nvim and kickstart will take over. After its done: 
```
ln -s ~/dotfiles/init.lua ~/.config/nvim/init.lua
```

## Rofi

```bash
sudo apt instal rofi
mkdir ~/.confif/rofi
ln -s ~/dotfiles/rofi/config.rasi ~/.config/rofi/config.rasi
```

## Git Stuff
For commits and pushing stuff to git, the .gitconfig needs to be edited. This is not a symbolic link so 
```
vim ~/.gitconfig
```
Add name and email. 

To create Key
To update key in github


### Utilities
- Yay
- fastfetch
- 1password
- syncthing
- imagemagick
- obsidian
- Ghostty / Homebrew theme
- Musikcube / Moc / DeadBeef



## General updates

This in case the OS install didn't made the user 'sudoer'
```shell
sudo EDITOR=vi visudo

#User privilege specification
username ALL=(ALL) NOPASSWD: /sbin/reboot, /sbin/shutdown
```



## Random notes

