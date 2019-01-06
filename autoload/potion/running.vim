function! potion#running#PotionCompileAndRunFile()
  write
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

function! potion#running#PotionShowBytecode()
  write

  let bytecode = system(g:potion_command . " -c -V " . bufname("%"))

  if bytecode =~ '\v^\*\* Syntax error'
    echoerr "Syntax Error"
  else
    let potion_bytecode_buffer = bufwinnr('__Potion_Bytecode__')

    if potion_bytecode_buffer >= 0
      execute potion_bytecode_buffer . "wincmd w"
    else
      split __Potion_Bytecode__
    endif

    normal! ggdG
    setlocal filetype=potionbytecode
    setlocal buftype=nofile

    call append(0, split(bytecode, '\v\n'))
  end
endfunction
