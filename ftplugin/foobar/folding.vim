setlocal foldmethod=expr
setlocal foldexpr=<SID>FoobarFold(v:lnum)

function! s:FoobarFold(lnum)
  if a:lnum ==# 1
    return '1'
  elseif getline(a:lnum) =~? '\v(CAT|DOG)1'
    return '>2'
  elseif getline(a:lnum) =~? '\v(CAT|DOG)3'
    return '<2'
  elseif getline(a:lnum) =~? '\v(CAT|DOG)'
    return '2'
  elseif a:lnum ==# 8
    return '1'
  end
endfunction
