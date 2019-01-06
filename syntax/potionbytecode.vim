if exists("b:current_syntax")
  finish
endif

syntax keyword potionbytecodeKeyword call return

highlight link potionbytecodeKeyword Keyword
