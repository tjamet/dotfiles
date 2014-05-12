" cscope make you enjoy the right click button!
" Custom right click menu to call cscope functions
"

if exists("loaded_cscopemenu")
  finish
endif
let loaded_cscopemenu = 1
set mousemodel=popup


function! PopulateMenu()
	exe "amenu PopUp.-Sep-                         		:"
if expand('$WITHOUT_CTAGS')=='$WITHOUT_CTAGS' || $WITHOUT_CTAGS!=1
	exe "amenu PopUp.File<Tab><F4>       			    :cscope find f <C-R>=expand('<cfile>')<CR><CR>"
	exe "amenu PopUp.Symbol<Tab><F5>     			    :cscope find s <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Definition<Tab><F6> 			    :cscope find g <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Call<Tab><F7>       			    :cscope find c <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Text<Tab>           			    :cscope find t <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.Egrep<Tab>          			    :cscope find e <C-R>=expand('<cword>')<CR><CR>"
	exe "amenu PopUp.GoBack<Tab><Ctl-t>  			    <C-t>"
	exe "amenu PopUp.-Sep-               			    :"
	exe "amenu PopUp.DatabaseUpdate<Tab><F3>       		:call AutotagsUpdate()<CR>"
	exe "amenu PopUp.AddExtDatabase<Tab><Shift-F3> 		:call AutotagsAdd()<CR>"
	exe "amenu PopUp.-Sep-                         		:"
endif
	exe "amenu PopUp.ToggleTagList<Tab><F8>             :TlistToggle<CR>"
	exe "amenu PopUp.-Sep-                         		:"
endfunc


if has("vim_starting")
	augroup LoadBufferPopup
	au! VimEnter * call PopulateMenu()
	au  VimEnter * au! LoadBufferPopup
	augroup END
else
	call PopulateMenu()
endif
