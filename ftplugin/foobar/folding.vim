setlocal foldmethod=expr
setlocal foldexpr=FoobarFold(v:lnum)
setlocal foldcolumn=4

function! FoobarFold(lnum)
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
