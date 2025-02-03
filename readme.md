# Dotfiles


```bash
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/bashrc ~/.bashrc
ln -s ~/dotfiles/gitconfig ~/.gitconfig
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

For environment specific things create a bash_env and put it there. 
```bash
cd ~/dotfiles
touch bash_env
```
This is to keep enviromnent specific things on each environment withouth bloating the file needlessly

If there's already a .bashrc or .bash_profile can be moved over
```bash
mv ~/.bashrc ~/dotfiles/bash_env
```
that way whatever is in there will continue to be there.


