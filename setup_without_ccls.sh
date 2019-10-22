#!/bin/bash

SETUP_PATH=$PWD

sudo apt-get update
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

# for ubuntu 16.04 installing llvm-7.0
sudo apt-add-repository -y "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-7 main"
sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt-get update

sudo apt-get remove -y vim

sudo apt-get install -y vim git curl python-dev python3 cmake build-essential libclang-7-dev libboost-all-dev python python3 python-dev python3-dev powerline fonts-powerline

cp ./.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/colors
touch ~/.vim/colors/space-vim-dark.vim

vim +PlugInstall +qall

rm ~/.vim/colors/space-vim-dark.vim
ln -s ~/.vim/plugged/space-vim-dark/colors/space-vim-dark.vim ~/.vim/colors/space-vim-dark.vim

python3 -m pip install python-language-server --user

cp ./TabNine.toml ~/.config/TabNine/
