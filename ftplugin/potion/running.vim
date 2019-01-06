if !exists("g:potion_command")
  let g:potion_command = "~/git_clones/potion/bin/potion"
endif

function! PotionCompileAndRunFile()
  silent !clear
  execute "!" . g:potion_command . " " . bufname("%")
endfunction

nnoremap <buffer> <localleader>r :call PotionCompileAndRunFile()<cr>
