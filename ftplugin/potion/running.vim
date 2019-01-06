if !exists("g:potion_command")
  let g:potion_command = "~/git_clones/potion/bin/potion"
endif

function! PotionCompileAndRunFile()
  write
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! PotionShowBytecode()
  write

  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

  split __Potion_Bytecode__
  normal! ggdG
  setlocal filetype=potionbytecode
  setlocal buftype=nofile

  call append(0, split(bytecode, '\v\n'))
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
nnoremap <buffer> <localleader>b :call PotionShowBytecode()<cr>)
