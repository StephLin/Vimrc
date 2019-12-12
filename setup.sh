#!/bin/bash

SETUP_PATH=$PWD

sudo apt-get update
# wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | sudo apt-key add -
#
# # for ubuntu 16.04 installing llvm-7.0
# sudo apt-add-repository -y "deb http://apt.llvm.org/$(lsb_release -cs)/ llvm-toolchain-$(lsb_release -cs)-7 main"
sudo apt-add-repository -y ppa:jonathonf/vim
sudo apt-get update

sudo apt-get remove -y vim

sudo apt-get install -y vim git curl cmake build-essential python python3 python-dev python3-dev python-pip python3-pip powerline fonts-powerline libtinfo-dev silversearcher-ag

cp ./.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

mkdir -p ~/.vim/colors
touch ~/.vim/colors/space-vim-dark.vim

vim +PlugInstall +qall

rm ~/.vim/colors/space-vim-dark.vim
ln -s ~/.vim/plugged/space-vim-dark/colors/space-vim-dark.vim ~/.vim/colors/space-vim-dark.vim

python3 -m pip install python-language-server yapf flake8 --user

mkdir -p ~/.config/TabNine
cp ./TabNine.toml ~/.config/TabNine

# build fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# build ccls
mkdir -p ~/.vim/makes
cd ~/.vim/makes
git clone --depth=1 --recursive https://github.com/MaskRay/ccls
cd ccls
wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
cmake --build Release

echo 'export PATH=$PATH:/'$PWD'/Release' >> ~/.bashrc
source ~/.bashrc
