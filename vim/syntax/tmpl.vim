if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'tmpl'
endif

if version < 600
  unlet! tmpl_folding
  if exists("tmpl_sync_method") && !tmpl_sync_method
    let tmpl_sync_method=-1
  endif
  so <sfile>:p:h/html.vim
else
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

syn cluster tmplAddStrings add=@htmlTop


syn region tmpl_replace start="<%" end="%>" contains=tmpl_replace fold
"syn match  tmpl_statement '^%\w'

hi def link		tmpl_replace       Delimiter
"hi def link		tmpl_statement     Statement


let b:current_syntax="tmpl"

