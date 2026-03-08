#!/bin/bash

POSITIONAL_ARGS=()
install=false
symlinks=false

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -i|--install)
      #echo "Install"
      install=true
      shift # past argument
      # shift # past value if you want to 
      ;;
    -s|--symlink)
      #echo "Symlinks only"
      symlinks=true
      shift # past argument
      # shift # past value if you want to 
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
#    *)
#      POSITIONAL_ARGS+=("$1") # save positional arg
#      shift # past argument
#      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters


if [ $install = false ] ; then
    echo "Not installing..."
fi

if [ $symlinks = false ] ; then
    echo "Not setting up symlinks/config..."
fi

# Install the things if needed
if [ $install = true ] ; then
    cd ~
    # Install Zsh for all (not local user)
    echo "Installing Zsh..."
    sudo apt install zsh

    # Set Zsh as default shell. 
    echo "Setting zsh as default shell..."
    chsh -s /usr/bin/zsh 

    # Install ZIM https://zimfw.sh/docs/
    echo "Installing ZIM..."
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    # use my own zimrc
    rm $HOME/.zimrv
    ln -s $HOME/dotfiles/bash/zimrc $HOME/.zimrc

    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
      

    # Install some standard bits
    echo "Intalling tools..."
    sudo apt install bat 
    sudo apt install btop
    sudo apt install fd-find 
    sudo apt install ripgrep 

    echo "Installing Lazygit..."
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
    tar xf lazygit.tar.gz lazygit
    sudo install lazygit -D -t /usr/local/bin/
    rm lazygit*

    # Install zoxide https://github.com/ajeetdsouza/zoxide
    curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

    # install eza 
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    sudo apt update
    sudo apt install -y eza

    # Git will need to have been installed already
    sudo apt install git-delta
    git config --global core.pager delta
    git config --global interactive.diffFilter 'delta --color-only'
    git config --global delta.navigate true
    git config --global delta.side-by-side true
    git config --global merge.conflictStyle zdiff3

    # install Dust
    curl -sSfL https://raw.githubusercontent.com/bootandy/dust/refs/heads/master/install.sh | sh

fi

# Setup the symlinks things if needed
if [ $symlinks = true ] ; then
   
    # Starship config
    echo "Setting up Starship config..."
    rm $HOME/.config/starship.toml
    ln -s $HOME/dotfiles/starship/starship.toml $HOME/.config/starship.toml 

    # Set up my bash things and use zsh as my bash shell (backup/work shell)
    # clear out any symlinks/files to be replaced by my own
    rm $HOME/.bashrc
    rm $HOME/.profile
    rm $HOME/.work-profile
    # Create symlinks
    ln -s $HOME/dotfiles/bash/bashrc $HOME/.bashrc
    ln -s $HOME/dotfiles/bash/profile $HOME/.profile
    ln -s $HOME/dotfiles/bash/work-profile $HOME/.work-profile

    rm $HOME/.zshrc
    ln -s $HOME/dotfiles/bash/zshrc $HOME/.zshrc

    rm $HOME/.zshenv
    ln -s $HOME/dotfiles/bash/zshenv $HOME/.zshenv

fi

