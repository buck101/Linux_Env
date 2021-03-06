
exit

cat hosts >> /etc/hosts

rm -rf ~/.gdbinit
rm -rf ~/.vimrc
rm -rf ~/.vim
rm -rf ~/.bashrc

cat bashrc >> ~/.bashrc
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
git submodule add https://github.com/Valloric/YouCompleteMe.git vim/bundle/YouCompleteMe
git submodule add https://github.com/Mizuchi/STL-Syntax.git vim/bundle/STL-Syntax
git submodule add https://github.com/dyng/ctrlsf.vim.git vim/bundle/ctrlsf.vim
git submodule add https://github.com/rking/ag.vim vim/bundle/ag.vim
git submodule add https://github.com/scrooloose/nerdcommenter vim/bundle/nerdcommenter
git submodule add https://github.com/SirVer/ultisnips.git vim/bundle/ultisnips
git submodule add https://github.com/honza/vim-snippets.git vim/bundle/vim-snippets
git submodule add https://github.com/plasticboy/vim-markdown.git vim/bundle/vim-markdown
git submodule add https://github.com/vim-pandoc/vim-pandoc-syntax.git vim/bundle/vim-pandoc-syntax
git submodule add https://github.com/vim-pandoc/vim-pandoc.git vim/bundle/vim-pandoc
git submodule add https://github.com/fatih/vim-go.git vim/bundle/vim-go


git submodule init
git submodule update

cd vim/bundle/YouCompleteMe
git submodule update --init --recursive
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

cd ..
tar xvzf vimcdoc-1.9.0.tar.gz
cd vimcdoc-1.9.0
sudo ./vimcdoc.sh -I


