#!/usr/bin/env fish
echo 'Loading profile.fish'

# set PATH so it includes user's private bin if it exists
if test -d "$HOME/bin" 
    set PATH $HOME/bin $PATH
end

# set PATH so it includes user's private .local bin if it exists
if test -d "$HOME/.local/bin"
    set PATH $HOME/.local/bin $PATH
end

set DOTS $HOME/dotfiles

set EDITOR vim
set GIT_EDITOR vim


starship init fish | source


