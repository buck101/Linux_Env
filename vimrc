
syntax enable
syntax on
filetype plugin indent on

set nocompatible    "关闭vi兼容
set number 
set vb t_vb=                    " set nobell

set tabstop=4 	"same as set ts=4 每个tab表示4个空格
set expandtab	"same as set et 用空格展开tab
set listchars=tab:>-,trail:- "展开时用什么符号显示tab

set helplang=en "用英文帮助文档而不是中文帮助

"set softtabstop=4
"set shiftwidth=4
"set showmatch
"set nohlsearch                  " no hightlight search
"set cursorline         " set current line underline
"set nobackup
"set helplang=en

"选择配色方案
"colorscheme desert

"=============for pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

"setting for multi-encoding ========================================
if has("multi_byte")
 set encoding=utf-8
 set termencoding=utf-8
 set fileencoding=utf-8
else
 echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif


"setting for NERD tree===============================================
nmap <silent> <leader>tt :NERDTreeToggle<cr>
let NERDTreeWinSize=30

"setting for taglist=================================================
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1                               " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1                             " 如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window=1                    " 在右侧窗口中显示taglist窗口
let Tlist_Auto_Update=1                                 " update tags automatically
let Tlist_Auto_Highlight_Tag=1 
let Tlist_Highlight_Tag_On_BufEnter=1   " highlight on current tag
let Tlist_Show_Menu=0                                   " show tags menu
let Tlist_Auto_Highlight_Tag=1 
map <C-]> g<C-]>
"map <C-]> :tag<cr>
"let Tlist_Auto_Open = 1                " open tablist automatically
"let Tlist_Close_On_Select=1                            " close tablist on select
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

set tags+=tags/tags
set tags+=~/Work/taishan/server/framecommon/tags/tags
set tags+=~/Work/taishan/server/srvframe/tags/tags

"set tags+=~/.vim/cpp_src/tags
set tags+=/usr/include/tags
cs add ~/.vim/cpp_src/cscope.out ~/.vim/cpp_src/
cs add /usr/include/cscope.out /usr/include/

"
Helptags
