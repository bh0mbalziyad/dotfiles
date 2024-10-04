# Dotfiles
---
Contains dotfiles for my systems

## Requirements
---
Ensure you have the following installled on your system

### Git

`brew install git`

### Stow

`brew install stow`


## Installation
---
Checkout the repo in your $HOME directory using git
```shell
$ cd ~/
$ git clone git@github.com:bh0mbalziyad/dotfiles.git 
$ cd dotfiles
```

Then use stow to create the symlinks
```shell
$ stow --restow */
```

If you have GNU Make you could also use the provided makefile
```shell
# to create/update symlinks
$ cd ~/dotfiles; make

# to delete symlinks
$ cd ~/dotfiles; make delete
```
