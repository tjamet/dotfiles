"
" ALPHA !! Autocompletion Feature (CtrlX-CtrlO) 
"

if exists("g:loaded_omni") || &cp
    finish
endif
let g:loaded_omni   = 1.0
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""
"Omni-completion par CTRL-X_CTRL-O
"""""""""""""""""""""""""""""""""""""""""""""""""""
au FileType html        set omnifunc=htmlcomplete#CompleteTags
au FileType css         set omnifunc=csscomplete#CompleteCSS
au FileType javascript  set omnifunc=javascriptcomplete#CompleteJS
au FileType c           set omnifunc=ccomplete#Complete
au FileType php         set omnifunc=phpcomplete#CompletePHP
au FileType ruby        set omnifunc=rubycomplete#Complete
au FileType sql         set omnifunc=sqlcomplete#Complete
au FileType python      set omnifunc=pythoncomplete#Complete
au FileType xml         set omnifunc=xmlcomplete#CompleteTags

" Enable omnicppcompletion
set nocp
let OmniCpp_ShowAccess = 0
let OmniCpp_LocalSearchDecl=1
let OmniCpp_MayCompleteDot = 1 " autocomplete after .
let OmniCpp_MayCompleteArrow = 1 " autocomplete after ->
let OmniCpp_MayCompleteScope = 1 " autocomplete after ::
