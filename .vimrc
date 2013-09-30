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
Bundle "altercation/vim-colors-solarized"
Bundle "Valloric/YouCompleteMe"
Bundle "Rainbow-Parentheses-Improved-and2"
Bundle "groovy.vim"
Bundle "tfnico/vim-gradle"

""激活 Rainbow Parentheses
"""" colorfull ((((()))))


" read file vim73/rgb.txt for all named colors
"" TODO fixme 
let s:guifgs = exists('g:rainbow_guifgs')? g:rainbow_guifgs : [
			\ 'RoyalBlue3', 'DarkOrange3', 'SeaGreen3', 'FireBrick',
			\ ]
			"\ 'DarkOrchid3', 'RoyalBlue3', 'SeaGreen3',
			"\ 'DarkOrange3', 'FireBrick', 

let s:ctermfgs = exists('g:rainbow_ctermfgs')? g:rainbow_ctermfgs : [
			\ 'gray', 'blue', 'magenta',
			\ 'cyan', 'red', 'green',
			\ ]

let g:rainbow_active = 1 
let g:rainbow_operators = 1 

"包含其它文件
""快捷键设定文件 
source $HOME/.vim/rcfile/mappings.vim
""外观文件
source $HOME/.vim/rcfile/appearance.vim
""子函数文件
source $HOME/.vim/rcfile/function.vim
""自动添加文件头文件
source $HOME/.vim/rcfile/fileheader.vim

"默认为缩进折叠
set foldmethod=indent
set foldcolumn=3 "设置折叠区域的宽度
set foldenable
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

"Tlist 和 wm的设置
"命令模式输入wm打开Tlist和WM
set showcmd
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

set cscopequickfix=s-,c-,d-,i-,t-,e-

"检测文件的类型 开启codesnip
"filetype on
filetype plugin on
filetype indent on
filetype plugin indent on

"鼠标支持
if has('mouse')
   set mouse=a
endif

set autoread " 自动重新加载外部修改内容
set autochdir " 自动切换当前目录为当前文件所在的目录 

set noerrorbells
set visualbell
if has('autocmd')
   autocmd GUIEnter * set vb t_vb=
endif

"默认无备份
set nobackup
set nowritebackup

"在insert模式下能用删除键进行删除
set backspace=start,indent,eol

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

"自动回到最后编辑的位置
if has("autocmd")
   autocmd BufRead *.txt set tw=78
   autocmd BufReadPost *
            \ if line("'\"") > 0 && line ("'\"") <= line("$") |
            \   exe "normal g'\"" |
            \ endif
endif

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

" bind :CD to :cd %:h, then change cwd to the dir that includes current file
sil! com -nargs=0 CD exe 'cd %:h' 

"字典完成
:set dictionary+=/usr/share/dict/words 

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

