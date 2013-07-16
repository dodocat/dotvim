"------------------------------------------------------------------------------
"Function    : Model_Sim_Compile() 
"Description : Compile with ModelSim  
"------------------------------------------------------------------------------

function Model_Sim_Compile()
     let l:file_type_temp = expand("%:e")
     if l:file_type_temp == "vhd"
         set makeprg=vcom\ -work\ work\ %
         execute ':make'
         execute ':cw'
    else
         if l:file_type_temp == "v" 
             set makeprg=vlog\ -work\ work\ %
             execute ':make'
             execute ':cw'
       else
             echohl ErrorMsg
             echo "This filetype can't be compiled by modelsim vcom/vlog!"
             echohl None 
         endif 
     endif
endfunction

"-------------------------------------------------------------------------------
"Function : Debug()
"Description :CTR-<F5> cll debug
"-------------------------------------------------------------------------------
func! Debug()
	if &filetype == 'c'
	    exec "w"
	    exec "! clear;
	    \ echo 正在编译: ./% ...;
	    \ echo ;
	    \ gcc % -g -o %<.o;
	    \ echo ;
	    \ echo 编译完成,开始调试;
	    \ gdb %<.o;"
    endif
endfunc

func! InsertFile()
	exec "r your_file_path;"
endfunc

"------------------------------------------------------------------------------
"Function : Compile()
"Description : 
"------------------------------------------------------------------------------
func! Compile()
	if &filetype == 'c'
		exec "w"
		exec "! clear;
		\ echo 正在编译: ./% ...;
		\ echo ;
		\ gcc % -g -o %<.o;
		\ echo ;
		\ echo 编译完成;"
    else
        call Model_Sim_Compile();
	endif
endfunc

func! Run()
    if &filetype == 'c'
        exec "! clear;
        \ ./%<.o;"
    endif
endfunc

function ClosePair(char)
   if getline('.')[col('.') - 1] == a:char
      return "\<Right>"
   else
      return a:char
   endif
endf
