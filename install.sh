#!/bin/bash
# Author:       jingqq5210@gmail.com
# Created Time: Tue 20 Aug 2013 09:50:58 AM CST
# FileName:     install.sh
# Description:  
# ChangeLog:

cdir=pwd
ln -s $cdir/.vimrc ~/.vimrc
git submodule update --init --recursive
cd ./bundle/YouCompleteMe/
./install.sh

