# My dotfiles
`setup.sh` can be used to install and configure my common setup & tooling.
Git will need to be installed and this repo cloned to `$HOME/dotfiles`

Current set up on Linux/WSL is default shell of Fish using Starship prompt (to try it out)
Backup/work is Zsh using Oh My Zsh

## Tools I use (need install)
Shells:

[Fish]() shell
[Starship] (https://starship.rs/)
Bat (run as batcat) - alternative to `cat`
lsd - alternative to ls
btm - alternative resource monitor to top

Zsh
Oh-my-Zsh [Website](https://ohmyz.sh/)

### Fish
Install and set up using `bash fish/install-fish.sh`
Comments & assumptions documented in the code.
Follows fish standards for auto loading conf & functions.
Doing it this way means there is no garuntee of load order, so confs/functions must not rely on each other at load time.
