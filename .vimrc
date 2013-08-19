"去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限
set nocp
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "TagHighlight"
Bundle "tpope/vim-sensible"
Bundle "vim-scripts/taglist.vim"
Bundle "vim-scripts/winmanager" 
Bundle "honza/vim-snippets"
Bundle "peterhoeg/vim-qml"
Bundle "vim-scripts/Visual-Mark"
Bundle "vim-scripts/sketch.vim"
Bundle "vim-scripts/a.vim"
Bundle "hallison/vim-markdown"
"包含其它文件
""快捷键设定文件 
source $HOME/.vim/rcfile/mappings.vim
""外观文件
source $HOME/.vim/rcfile/appearance.vim
""子函数文件
source $HOME/.vim/rcfile/function.vim
""自动添加文件头文件
source $HOME/.vim/rcfile/fileheader.vim

"设置语法折叠
set foldmethod=syntax
set foldcolumn=3 "设置折叠区域的宽度
"set foldclose=all "设置为自动关闭折叠
" 用空格键来开关折叠
set foldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"Tlist 和 wm的设置
"命令模式输入wm打开Tlist和WM
set showcmd
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

:set cscopequickfix=s-,c-,d-,i-,t-,e-

"检测文件的类型 开启codesnip
"filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

"设置为语法补全
set ofu=syntaxcomplete#Complete
set completeopt=longest,menu

"鼠标支持
if has('mouse')
   set mouse=a
endif

" ambiwidth 默认值为 single。在其值为 single 时，
" 若 encoding 为 utf-8，gvim 显示全角符号时就会
" 出问题，会当作半角显示。
set ambiwidth=double       
set autoread                " 自动重新加载外部修改内容
set autochdir               " 自动切换当前目录为当前文件所在的目录 

"No bell settings {{{
set noerrorbells
set visualbell
if has('autocmd')
   autocmd GUIEnter * set vb t_vb=
endif
"No bell settings End }}}

"默认无备份
set nobackup
set nowritebackup

"在insert模式下能用删除键进行删除
set backspace=indent,eol,start

"文字编码加入utf8
set enc=utf8
set fileencodings=utf-8,gb18030,utf-16,big5
let &termencoding=&encoding 

" 使用英文菜单,工具条及消息提示
set langmenu=none 

"自动缩排
set ai
"搜索不分大小写
set ic
"标识关键字
set hls

"设置帮助语言
if version >= 603
   set helplang=cn
endif

"自动回到最后编辑的位置
if has("autocmd")
   autocmd BufRead *.txt set tw=78
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal g'\"" |
            \ endif
endif

" build tags of your own project with Ctrl-F12
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" OmniCppComplete
let OmniCpp_DefaultNamespaces = ["std"]
let OmniCpp_DisplayMode = 1
let OmniCpp_ShowScopeInAbbr = 0
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

"智能补全ctags -R --c++-kinds=+p --fields=+iaS --extra=+q 

highlight Pmenu ctermbg=13 guibg=LightGray
highlight PmenuSel ctermbg=7 guibg=DarkBlue guifg=White
highlight PmenuSbar ctermbg=7 guibg=DarkGray
highlight PmenuThumb guibg=Black
"打开自己工程的时候自动加载的脚本
if getfsize(".vimscript")>0
   source .vimscript
endif

"bufferexplorer设置"实现<C-Tab>     向前循环切换到每个buffer上,并在当前窗口打开
let g:miniBufExplMapCTabSwitchBufs = 1
"<C-S-Tab>     向后循环切换到每个buffer上,并在当前窗口打开

"选中一段文字并全文搜索这段文字
:vnoremap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR> 
:vnoremap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"rails.vim
runtime! macros/matchit.vim
augroup myfiletypes
   " Clear old autocmds in group
   autocmd!
   " autoindent with two spaces, always expand tabs
   autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

"autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete 
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
"if you want buffer/rails/global completion you must add the following:
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
"if you want rails support add the following in addition 
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
"if you want classes included in global completions add the following  
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

"valgrind 相关
let g:valgrind_arguments='--leak-check=yes --num-callers=5000'

" bind :CD to :cd %:h, then change cwd to the dir that includes current file
sil! com -nargs=0 CD exe 'cd %:h' 

"字典完成
:set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words 

"cscope
if has("cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set nocst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
      " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

