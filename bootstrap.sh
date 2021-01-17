#!/usr/bin/bash

working_dir=$(dirname "$0")
os=$(uname)

if [[ $os == 'Linux' ]]; then
    rc_name='bashrc'

    echo "Validate sudo credentials ..."
    sudo -v

    #Updating Package List and Upgrading them
    sudo apt-get update
    sudo apt-get dist-upgrade

    #Software Install - System Utilities
    sudo apt-get install -y htop tree git chromium-browser vim

    #Clear apt cache
    sudo apt-get autoclean
    sudo apt-get autoremove

elif [[$os == 'Darwin' ]]; then
    rc_name='bash_profile'

else
    echo 'Unknown OS, Exiting'
    exit 1
fi

#Software Install - fzf(github.com/junegunn/fzf)
if [ ! -d ~/.fzf/ ]; then    
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install --key-bindings --completion --update-rc
fi

#Setup - Bash
cp $working_dir/$os/$rc_name ~/.$rc_name
cp $working_dir/shared_configs/bash_aliases ~/.bash_aliases
cp $working_dir/shared_configs/bash_functions ~/.bash_functions

#Setup - Vim
cp $working_dir/shared_configs/vimrc ~/.vimrc
mkdir -p  ~/.vim/colors/
cp $working_dir/shared_configs/rupza.vim ~/.vim/colors/rupza.vim

#Setup - SSH
mkdir -p ~/.ssh/sockets/
cp $working_dir/shared_configs/config ~/.ssh/config

echo "All Done :)"