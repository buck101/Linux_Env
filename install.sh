
exit

rm -rf ~/.gdbinit
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.bashrc

ln -s `pwd`/bashrc ~/.bashrc
ln -s `pwd`/gdbinit ~/.gdbinit

ln -s `pwd`/vimrc ~/.vimrc
mkdir vim
ln -s `pwd`/vim ~/.vim
git submodule add https://github.com/tpope/vim-pathogen.git vim/bundle/vim-pathogen
git submodule add https://github.com/gmarik/vundle.git vim/bundle/vundle
git submodule add https://github.com/mattn/emmet-vim.git vim/bundle/emmet-vim
git submodule add https://github.com/vim-scripts/taglist.vim.git vim/bundle/taglist
git submodule add https://github.com/scrooloose/nerdtree.git vim/bundle/nerdtree
git submodule add https://github.com/fholgado/minibufexpl.vim.git vim/bundle/minibufexpl.vim
git submodule add https://github.com/vim-scripts/a.vim.git vim/bundle/a.vim
git submodule add https://github.com/vim-scripts/Visual-Mark.git vim/bundle/Visual-Mark
git submodule add https://github.com/Valloric/YouCompleteMe.git vim/bundle/YouCompleteMe

git submodule init
git submodule update

cd vim/bundle/YouCompleteMe
#git submodule update --init --recursive
./install.sh --clang-completer
cd -


#git submodule add https://github.com/vim-scripts/winmanager.git vim/bundle/winmanager

cd dl
bunzip2 -d vim-7.4.tar.bz2
tar xvf vim-7.4.tar
cd vim74
./configure  --prefix=/usr --disable-gui --disable-selinux --enable-cscope --enable-pythoninterp --enable-multibyte --enable-xim --enable-fontset --enable-netbeans --with-features=huge --enable-perlinterp --enable-python3interp --enable-tclinterp --enable-rubyinterp --enable-luainterp  
make
sudo make install




