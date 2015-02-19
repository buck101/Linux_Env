
syntax enable
syntax on
filetype plugin indent on

set nocompatible    "关闭vi兼容
set number 
set vb t_vb=                    " set nobell
"set t_Co=256    "配合ssh使用

set tabstop=4 	"same as set ts=4 每个tab表示4个空格
set expandtab	"same as set et 用空格展开tab
set softtabstop=4
set shiftwidth=4
set listchars=tab:>-,trail:- "展开时用什么符号显示tab

set helplang=en         "用英文帮助文档而不是中文帮助

set showmatch           " 高亮显示匹配的括号 
"set nohlsearch         " no hightlight search
"set cursorline         " set current line underline
"set nobackup


"选择配色方案
"colorscheme desert


"在多窗口中跳来跳去的快捷键映射
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

"与vim自带的补全complete相关的设置
"set omnifunc=syntaxcomplete#Complete  "开启Omni补全
set completeopt=longest,menuone,menu  "取消全能补全预览窗口
"set complete
inoremap <C-]> <C-X><C-]>
inoremap <C-F> <C-X><C-F>
inoremap <C-D> <C-X><C-D>
inoremap <C-L> <C-X><C-L>
inoremap <C-O> <C-X><C-O>


"=============for pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()


"=============for STL-Syntax 
"增加对STL类高亮的支持


"setting for multi-encoding ========================================
if has("multi_byte")
 set encoding=utf-8
 set termencoding=utf-8
 set fileencoding=utf-8
else
 echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif


"=============for ag.vim
let g:agprg="ag --case-sensitive --column"

"=============for ultisnips
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><c-b>"
let g:UltiSnipsJumpBackwardTrigger="<leader><c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["mysnippets","UltiSnips"] 
let g:UltiSnipsSnippetsDir = '~/.vim/mysnippets'


"=============for CtrlSF
let g:ctrlsf_ackprg='ag'
let g:ctrlsf_position='bottom'
let g:ctrlsf_context=''
let g:ctrlsf_winsize='30%'

nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>


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

"setting for minibufexpl===============================================
let g:miniBufExplorerMoreThanOne=1                      " 即使只有一个文件，也显示minibuf窗口

"setting for YouCompleteMe===============================================
"let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py' 
nnoremap <leader>gd :YcmCompleter GoToDefinitionElseDeclaration<CR>


"setting for man
source $VIMRUNTIME/ftplugin/man.vim
nmap <C-M> :Man 3 <cword><CR>

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
