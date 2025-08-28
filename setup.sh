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
    # Install Zsh for all (not local user)
    echo "Installing Zsh..."
    sudo apt install zsh
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    
    # Install some custom ZSH plugins
    export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

    # Note:
    # when cloning these repos on WSL, sometimes get Windows line endings
    # If that happens go into the root dir of each plugin and run `find . -type f -print0 | xargs -0 dos2unix` to convert all files to unix line endings
    #install zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
    
    #install zsh syntax highlighting
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting


    # Set Zsh as default shell. This assumes fish is install for all (sudo apt install fish)
    echo "Setting zsh as default shell..."
    chsh -s /usr/bin/zsh 

    echo "Installing Starship..."
    curl -sS https://starship.rs/install.sh | sh
      

    # Install some standard bits
    echo "Intalling tools..."
    sudo apt install bat 
    sudo apt install lsd
    sudo apt install btm
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

    # echo "Setting up Fish config..."
    # bash $HOME/dotfiles/configure-fish.sh
fi

