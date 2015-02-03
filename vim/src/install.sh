#!/bin/bash
hg clone https://vim.googlecode.com/hg/ vim_latest
cd vim_latest/src
./configure  --prefix=/usr --disable-gui --disable-selinux --enable-cscope --enable-pythoninterp --enable-multibyte --enable-xim --enable-fontset --enable-netbeans --with-features=huge 
make
make install
#install vim zh help
#cd ../..
#tar xzvf vimcdoc-1.8.0.tar.gz 
#cd vimcdoc-1.8.0/
#./vimcdoc.sh  -i 
#cd ..
