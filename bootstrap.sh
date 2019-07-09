#!/bin/bash

set -eux pipefail

#Add Deb Servers - Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

#Add Deb Servers - Atom
wget -qO - https://packagecloud.io/AtomEditor/atom/gpgkey | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] https://packagecloud.io/AtomEditor/atom/any/ any main" > /etc/apt/sources.list.d/atom.list'


echo "Updating package List ..."
sudo apt-get update

echo "Validate sudo credentials ..."
sudo -v

#Software Install - Blue Light Dimmer
sudo apt-get install -y redshift

#Software Install - System Utilities
sudo apt-get install -y htop tree

#Software Install - Spotify
sudo apt-get install -y spotify-client

#Cofigure Spotify
#sign-on and spotify cli @(TODO)

#Software Install - Atom
sudo apt-get install -y atom

#Configure Atom 
apm install autocomplete-python
apm install highlight-selected
apm install language-docker
apm install anguage-dotenv
apm install linter-kubectl
#theme install and settings cofigure @(TODO)

#Software Install -  fzf(github.com/junegunn/fzf)
git clone --depth 1 https://github.com/junegunn/fzf.git /tmp/.fzf
/tmp/.fzf/install --key-bindings --completion --update-rc

#Setup vim
cp ./vimrc ~/vimrc
cp ./rupza.vim ~/.vim/colors/rupza.vim

#Setup Bash
cp ./.bashrc ~/.bashrc

#Configure git 
#write file to copy over @(TODO)

#Reload Bash
exec bash
