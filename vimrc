" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc
" Buck
imap jj <Esc>
map <C-C> y
map <C-X> d
map <C-A> <Esc>ggVG

"global setting
syntax on


" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set history=500		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
" if has('mouse')
"   set mouse=a
" endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

"setting for vim=======================================================
set number				" set show line num
set vb t_vb=			" set nobell
filetype on

<<<<<<< HEAD
set expandtab
=======
set ts=4
set expandtab
set autoindent
>>>>>>> d6fb510038d4b0f8f2e3a5ede9c87e5f2fde7751
set softtabstop=4
set tabstop=4
set shiftwidth=4
set showmatch
set nohlsearch			" no hightlight search
set listchars=tab:>-,trail:-
set nobackup
set helplang=en
"set cursorline     	" set current line underline

"setting for windows===================================================
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l 

"setting for pathogen=========================================
call pathogen#infect()

"setting for filebuffer switch=========================================
nmap <C-N> :bnext<CR>
nmap <C-P> :bprevious<CR> 

"setting for bufeplorer================================================
let g:bufExplorerSortBy='number'		" Sort by the buffer's number.

"setting for minibufexpl===============================================
let g:miniBufExplorerMoreThanOne=1			" 即使只有一个文件，也显示minibuf窗口

"setting for NERD tree===============================================
nmap <silent> <leader>tt :NERDTreeToggle<cr>
let NERDTreeWinSize=30

"setting for taglist=================================================
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1				" 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1				" 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1			" 在右侧窗口中显示taglist窗口
let Tlist_Auto_Update=1					" update tags automatically
let Tlist_Auto_Highlight_Tag=1 
let Tlist_Highlight_Tag_On_BufEnter=1	" highlight on current tag
let Tlist_Show_Menu=0					" show tags menu
let Tlist_Auto_Highlight_Tag=1 
map <C-]> g<C-]>
"map <C-]> :tag<cr>
"let Tlist_Auto_Open = 1                " open tablist automatically
"let Tlist_Close_On_Select=1				" close tablist on select
"let Tlist_WinHeight=50
let Tlist_WinWidth=30
map <silent><leader>tl :TlistToggle<cr>

"setting for winmanager==============================================
let g:winManagerWindowLayout = "FileExplorer,BufExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
nmap <silent> <leader>wm :WMToggle<cr>

"setting for cscope+ctags===========================================
cs add tags/cscope.out
cs add ~/Work/taishan/server/framecommon/tags/cscope.out 
cs add ~/Work/taishan/server/srvframe/tags/cscope.out 

"set autochdir
set tags+=tags/tags
set tags+=~/Work/taishan/server/framecommon/tags/tags
set tags+=~/Work/taishan/server/srvframe/tags/tags

"set tags+=~/.vim/cpp_src/tags
"set tags+=/usr/include/tags
"cs add ~/.vim/cpp_src/cscope.out ~/.vim/cpp_src/
"cs add /usr/include/cscope.out /usr/include/


"setting for omnicppcomplete========================================
let OmniCpp_GlobalScopeSearch = 1  " 0 or 1
let OmniCpp_NamespaceSearch = 1   " 0 ,  1 or 2
let OmniCpp_DisplayMode = 1 
let OmniCpp_ShowScopeInAbbr = 0 
let OmniCpp_ShowPrototypeInAbbr = 1 
let OmniCpp_ShowAccess = 1 
let OmniCpp_MayCompleteDot = 1 
let OmniCpp_MayCompleteArrow = 1 
let OmniCpp_MayCompleteScope = 1 
"let g:SuperTabRetainCompletionType=2
"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
set completeopt=longest,menu
let g:EchoFuncKeyPrev='<Up>'
let g:EchoFuncKeyNext='<Down>' 

"setting for multi-encoding ========================================
if has("multi_byte")
  "set bomb
  set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
  set encoding=utf-8
  set termencoding=utf-8
  set fileencoding=utf-8
else
  echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif

