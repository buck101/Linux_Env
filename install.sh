
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
git submodule add https://github.com/mattn/emmet-vim.git vim/bundle/emmet-vim
git submodule add https://github.com/gmarik/vundle.git vim/bundle/vundle
git submodule add https://github.com/scrooloose/nerdtree.git vim/bundle/nerdtree
