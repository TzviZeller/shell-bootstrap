#!/usr/bin/bash

set -ev  # Exit with nonzero exit code if anything fails

echo "Validate sudo credentials ..."
sudo -v

#Add Deb Server - Spotify
wget -qO - https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb [arch=amd64] http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

#Add Deb Server - Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ stable main" | sudo tee /etc/apt/sources.list.d/atom.list

#Add Deb Server - Chrome
wget -qO - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" | sudo tee /etc/apt/sources.list.d/google-chrome.list


#Updating Package List and upgrade
sudo apt-get update
sudo apt-get dist-upgrade

#Software Install - System Utilities
sudo apt-get install -y htop tree

#Software Install - Chrome
sudo apt-get install google-chrome-stable

#Software Install - Blue Light Dimmer
sudo apt-get install -y redshift
#Configure Redshift
#TODO: config redshift for birtness and autostart

#Software Install - Spotify
sudo apt-get install -y spotify-client
#Cofigure Spotify
#TODO: sign-on and spotify cli

#Software Install - Atom
sudo apt-get install -y atom
#Configure Atom - Package Install
apm install highlight-selected
apm install autocomplete-python
apm install atom-beautify
apm install language-docker
apm install linter-kubectl
apm install markdown-preview
apm install todo-show
apm install open-in-browser
apm install highlight-selected
#Configure Atom - Theme Install
#TODO: theme install and settings config

#Software Install -  fzf(github.com/junegunn/fzf)
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --key-bindings --completion --update-rc


#Configure git
#TODO: config git for use

#Setup vim
cp ./vimrc ~/.vimrc
mkdir -p  ~/.vim/colors/
cp ./rupza.vim ~/.vim/colors/rupza.vim

#Setup Bash
cp ./bashrc ~/.bashrc

#Clear apt cache
sudo apt-get autoclean
sudo apt-get autoremove

#Reload Bash
exec bash

echo "All Done :)"
# exit 0
