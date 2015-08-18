# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private .local bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi


# GO stuff
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/workspace/go

# Shortcuts
export ZDOTDIR=$HOME
export DEPLOY=$HOME/assist_plus/deploy
export WORKSPACE=$HOME/workspace
export SKUNK=$WORKSPACE/skunk
export DVT4=$GOPATH/src/autologic.com/dvt4
export SKEL=$WORKSPACE/skel
export ODX=$WORKSPACE/odx
export ODX_DATA=$ODX/data

# Proxy settings
export no_proxy="localhost,127.0.0.1,192.168.90.90,192.168.0.*, *.autologic, 192.168.70.245:5000, sabre.autologic:28378"
