#!/bin/bash

# Requires config files are all in $HOME/dotfiles

# Set up some vars to use later
dotfiles_fish_path=$HOME/dotfiles/fish
fish_conf_path=$HOME/.config/fish

echo $fish_conf_path

# Create Fish config dirs
echo "Creating conf.d & function fish dirs..."
# Create standard fish dir for auto-loading of config files
mkdir $fish_conf_path/conf.d
# Create standard fish dir for auto-loading of functions
mkdir $fish_conf_path/functions


# Set up all sym links for auto loading fish conf
echo "Creating symlinks for fish conf.d..."
dotfiles_fish_confd_path=$dotfiles_fish_path/conf.d
fish_confd_path=$fish_conf_path/conf.d
for file in $dotfiles_fish_confd_path/*
do
    if [ -f $file ]
    then
        base_name=$(basename ${file})
        echo "Creating sym link: ${file} --> ${fish_confd_path}/${base_name}"
        rm $fish_confd_path/$base_name
        ln -s $file $fish_confd_path/$base_name
    fi
done

# Set up all sym links for auto loading fish functions
echo "Creating symlinks for fish functions..."
dotfiles_fish_functions_path=$dotfiles_fish_path/functions
fish_functions_path=$fish_conf_path/functions
for file in $dotfiles_fish_functions_path/*
do
    if [ -f $file ]
    then
        base_name=$(basename ${file})
        echo "Creating sym link: ${file} --> ${fish_functions_path}/${base_name}"
        rm $fish_functions_path/$base_name
        ln -s $file $fish_functions_path/$base_name
    fi
done
