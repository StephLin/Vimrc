#!/bin/bash
sudo apt-get update
wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -

# for ubuntu 16.04 installing llvm-7.0
sudo apt-add-repository -y "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-7 main"
sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt-get update

sudo apt-get remove -y vim

sudo apt-get install -y vim git python-dev python3 cmake build-essential libclang-7-dev libboost-all-dev python python3 python-dev python3-dev powerline fonts-powerline

cp ./.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim +PlugInstall +qall

mkdir ~/.ycm_build
cd ~/.ycm_build
cmake -G "Unix Makefiles" -DUSE_SYSTEM_BOOST=ON -DUSE_SYSTEM_LIBCLANG=ON . ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp
cmake --build . --target ycm_core --config Release
rm -r ~/.ycm_build

~/.vim/plugged/YouCompleteMe/install.py --clang-completer --system-libclang

mkdir -p ~/.vim/colors
ln -s ~/.vim/plugged/space-vim-dark/colors/space-vim-dark.vim ~/.vim/colors/space-vim-dark.vim

cp ~/.vim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py ~/.vim/plugged/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py
