#!/bin/bash
sudo apt-get update
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

# for ubuntu 16.04 installing llvm-6.0
sudo apt-add-repository "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-6.0 main"
sudo apt-get update

sudo apt-get install -y vim git python-dev python3 cmake build-essential llvm-6.0 clang-6.0 libclang-6.0-dev libboost-all-dev 

cp ./.vimrc ~
mkdir -p ~/.vim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone --recursive https://github.com/Valloric/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe

mkdir ~/.ycm_build
cd ~/.ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
rm -r ~/.ycm_build

python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

vim +PluginInstall +qall
