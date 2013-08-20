"------------------------------------------------
"FileName : appearance.vim
"Discripe : 外观设置
"
"------------------------------------------------

"配色
" Avoid clearing hilight definition in plugins
if !exists("g:vimrc_loaded")
    "Enable syntax hl
    syntax enable
    " color scheme
    if has("gui_running")
        set guioptions-=T "隐藏工具栏
        set guifont=Monaco\ 16
        set background=light
    else
        set background=dark
    endif
    colorscheme solarized
endif

" Line highlight 設此是游標整行會標註顏色
set cursorline
" Column highlight 設此是遊標整列會標註顏色
set cursorcolumn
"highlight CursorLine cterm=none ctermbg=2 ctermfg=0 

"语法高亮度显示
syntax on

"显示行号
set nu

"缩进相关
set autoindent
set cindent
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s
if &term=="xterm"
    set t_Co=8
    set t_Sb=^[[4%dm
    set t_Sf=^[[3%dm
endif
set expandtab 
set tabstop=4  
set shiftwidth=4 
set smarttab
set softtabstop=4

"在编辑过程中，在右下角显示光标位置的状态行
set ruler
set nolinebreak             " 在单词中间断行 
" 在状态栏显示目前所执行的指令，未完成的指令片段亦
" 会显示出来 
set showcmd
set wrap                    " 自动换行显示 
"CmdLine settings {{{
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2               " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r,%Y,%{&fileformat}\ \ \ ASCII=\%b,HEX=\%B\ \ \ %l,%c%V\ %p%%\ \ \ [\ %L\ lines\ in\ all\ ]
                            " 设置在状态行显示的信息如下：
                            " %F    当前文件名
                            " %m    当前文件修改状态
                            " %r    当前文件是否只读
                            " %Y    当前文件类型
                            " %{&fileformat}
                            "       当前文件编码
                            " %b    当前光标处字符的 ASCII 码值
                            " %B    当前光标处字符的十六进制值
                            " %l    当前光标行号
                            " %c    当前光标列号
                            " %V    当前光标虚拟列号 (根据字符所占字节数计算)
                            " %p    当前行占总行数的百分比
                            " %%    百分号
                            " %L    当前文件总行数
"CmdLine settings End }}} 
"
"显示匹配括号
set showmatch

