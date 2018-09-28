#!/bin/bash
sudo apt-get update
sudo apt-get install -y vim git python-dev python3 cmake build-essential

cp ./.vimrc ~
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --recursive [https://github.com/Valloric/YouCompleteMe.git](https://github.com/Valloric/YouCompleteMe.git) ~/.vim/bundle/YouCompleteMe

mkdir ~/.ycm_build
cd ~/.ycm_build
cmake -G "Unix Makefiles" . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release

cd ~/.vim/bundle/YouCompleteMe
python install.py --clang-completer

vim +PluginInstall +qall
