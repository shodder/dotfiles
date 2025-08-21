#!/usr/bin/env fish
echo 'Loading git-abbrs.fish'

abbr -a gs git status
abbr -a gd git diff
abbr -a ga git add
abbr -a gaa git add .
abbr -a gc git commit
abbr -a gr git reset
abbr -a pull git pull
abbr -a push git push
abbr -a gco git checkout
abbr -a stash git stash -u
abbr -a unstage git reset HEAD

# Logs
abbr -a whodunit 'git log --pretty=format":%an - %s"'
abbr -a oneliner git log --pretty=oneline --abbrev-commit --decorate
abbr -a onelinergraph git log --pretty=oneline --abbrev-commit --decorate --graph

