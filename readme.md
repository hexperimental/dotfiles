# Dotfiles

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
ln -s ~/dotfiles/gitconfig ~/.gitconfig
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

## Git Stuff
Add this to ~/.gitconfig
```shell
[include]
    path = ~/dotfiles/gitconfig.common
```
a bit awkward, but there's value in having each computer with its own identity.
Adding commands the 'git way' to test/try out and move to gitconfig.common when/if they're ready. 

