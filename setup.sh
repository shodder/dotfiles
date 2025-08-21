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
    # Install FISH for all (not local user)
    echo "Installing fish..."
    sudo apt install fish
    
    # Set Fish as default shell. This assumes fish is install for all (sudo apt install fish)
    echo "Setting fish as default shell..."
    chsh -s /usr/bin/fish 

    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
    
    echo "Installing Zsh..."
    sudo apt install zsh
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

    # Install some standard bits
    echo "Intalling tools..."
    sudo apt install bat 
    sudo apt install lsd
    sudo apt install btm
fi

# Setup the symlinks things if needed
if [ $symlinks = true ] ; then

    echo "Setting up Fish config..."
    bash $HOME/dotfiles/configure-fish.sh
    
    # Starship config
    echo "Setting up Starship config..."
    rm $HOME/.config/starship.toml
    ln -s $HOME/dotfiles/starship/arship.toml $HOME/.config/starship.toml 

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
fi

