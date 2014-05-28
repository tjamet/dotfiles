set nocompatible	" Use Vim defaults (much better!)
filetype off
set rtp+=~/.vim/bundle
call vundle#begin("~/vimPlugins")
Plugin 'gmarik/Vundle.vim'
Plugin 'Lokaltog/vim-powerline'
call vundle#end()
":VundleUpdate
":q

let g:Powerline_symbols = 'unicode'
"let g:Powerline_mode_V  = 'VISUAL LINE'
"let g:Powerline_mode_cv = 'VISUAL BLOCK'
"let g:Powerline_mode_S  = 'SELECT LINE'
"let g:Powerline_mode_cs = 'SELECT BLOCK'
set t_Co=256

set encoding=utf-8
set fileencoding=utf-8
filetype on

"source $TJ_ENV_DIR/.vim/mswin.vim
"source $TJ_ENV_DIR/.vim/colors/mysyncolor.vim

"Exhuberant ctags
"let Tlist_Ctags_Cmd = '~/ctags/bin/ctags'
"filetype on
"Taglist Plugin
"let Tlist_Process_File_Always = 1
"nmap <F8> :TlistToggle<CR>

"File type

"Any search with an uppercase character becomes a case sensitive search.
set ic
set scs

"set ignorecase smartcase
set autoindent
" no tab at LBC
set shiftwidth=4 tabstop=4
set expandtab
"set tags=~/tags

" First define default font, then try preferred other fonts...
"set guifont=-*-lucidatypewriter-medium-r-normal-*-10-*-*-*-m-*
"set guifont=fixed
set guifont=-misc-fixed-medium-r-normal-*-*-100-*-*-c-*-iso8859-15
"set guifont=-b&h-lucidatypewriter-medium-r-normal-*-*-100-*-*-m-*-iso8859-1
set guifont=Monospace\ 10,LucidaTypewriter\ 9,-b&h-lucidatypewriter-medium-r-normal-*-9-*-*-*-m-*-iso10646-1
"set guifont=LucidaTypewriter\ 9
set guifont=Monospace\ 9

" Switch off the Toolbar in GUI
"set guioptions-=T

" Display highlight parameters (and others) on console when launching vim
"set highlight is

" Do not break long lines, show < and > instead, show side-scrollbar
set textwidth=0
set sidescroll=8
set nowrap
"set wrap
set linebreak
"set showbreak=\ <<\ 
set guioptions+=b
set ruler
set laststatus=2
set showmatch

" Set autocompletion options (Tab key) on command line
" Function controlled via F5, F6, F7 keys
set suffixes=.bak,~,.va,.ve,.vea,.vmp,.v
" set wildignore=*.o,*.swp,*.dx,*.ncw,*.vmp,*.ncall,*.nca,*.nce,*.ncelab,*.ncdir/,*.wdir/,MAKE/,SCCS/,*_[0-9a-f][0-9a-f]*.*,*.sim.*
set wildmenu
set wildmode=longest,full

" Set printing paramters for :hardcopy command
set printfont=Courier_New:h6
"set printheader=%<%f%h%m%=Page\ %N
set printheader=%<%f%=Page\ %N
set printoptions=left:10mm,right:5mm,top:10mm,bottom:10mm,header:2,syntax:y,number:y,wrap:y,portrait:y,paper:A4

" Define characters to be listed in list mode (tab, eol, extends, precedes, trail
" Alternative charcters for listchars:  ° » « · ­ Þ ¤ ¶
" set listchars=tab:Þ·,extends:»,precedes:«,trail:¤
" set list
" highlight NonText    term=reverse cterm=NONE ctermbg=DarkMagenta ctermfg=Yellow gui=NONE guibg=DarkMagenta guifg=Yellow
" highlight SpecialKey term=italic  cterm=NONE ctermbg=LightGray ctermfg=Cyan     gui=NONE guibg=LightGray guifg=DarkGray
"silent source $HOME/.vim/script/list_some.vim

" Enable mouse also in vim on xterms etc.
"set mouse=a

" Map scroll up and down to Ctrl-Up and Ctrl-Down
map <C-Up> <C-Y>
map <C-Down> <C-E>

" Enable wheel mouse scrolling
"	:map <M-Esc>[62~ <MouseDown>
"	:map! <M-Esc>[62~ <MouseDown>
"	:map <M-Esc>[63~ <MouseUp>
"	:map! <M-Esc>[63~ <MouseUp>
"	:map <M-Esc>[64~ <S-MouseDown>
"	:map! <M-Esc>[64~ <S-MouseDown>
"	:map <M-Esc>[65~ <S-MouseUp>
"	:map! <M-Esc>[65~ <S-MouseUp>

" Function Keys:
" <F1>  - Reserved: Help
" <F2>  - 
" <F3>  - NONE Add comment (//) at beginning of line
" <F4>  - Remove comment (//) from beginning of line
" <F5>  - Set wildcard settings to limit to source files in VLSI database
" <F6>  - Set wildcard settings to some limits in VLSI database
" <F7>  - Set wildcard settings to general defaults
" <F8>  - not usable (Windows Menu)
" <F9>  - Clear match highlighting
" <F10> - not usable (Unix Menu)
" <F11> - Clear search highlighting
" <F12> - Show/Hide special characters (EOL,Tab etc.)

" Add and remove comments at current cursor position, following lines (with Shift-key) or on selected area
  "vmap <F3>   :s:^://:<CR>:nohlsearch<CR>
  "nmap <F3>   0i//<ESC>
  "nmap <S-F3> 0i//<ESC>j
  "imap <F3>   <ESC><F3>la
  "imap <S-F3> <ESC><F3>ji

  vmap <F4>   :s:^\([ 	]*\)\/\/:\1:<CR>:nohlsearch<CR>
  nmap <F4>   :. s:^\([ 	]*\)\/\/:\1:<CR>:nohlsearch<CR>
  nmap <S-F4> :.-1;/^[ 	]*\/\// s:^\([ 	\/]*\)\/\/:\1:<CR>:s:^\([ 	]*\)\/\/:\1:<CR>:nohlsearch<CR>
  imap <F4>   <ESC><F4>la
  imap <S-F4> <ESC><F4>ji

" <F5> Set wildcard settings to limit to source files in VLSI database
  nmap <F5> :set suffixes=.bak,~,.va,.ve,.vea,.vmp,.v<CR>:set wildignore=*.o,*.swp,*.dx,*.ncw,*.vmp,*.ncall,*.nca,*.nce,*.ncelab,*.ncdir/,*.wdir/,MAKE/,SCCS/,*_[0-9a-f][0-9a-f]*.*,*.sim.*<CR>:echo "RTL source filename expansion"<CR>

" <F6> Set wildcard settings to some limits in VLSI database
"  nmap <F6> :set suffixes=.bak,~,.h,.info,.va,.ve,.vea<CR>:set wildignore=*.o,*.swp,*.dx,*.ncw,*.ncall,*.nca,*.nce,*.ncelab,*.ncdir/,*.wdir/,MAKE/,SCCS/<CR>:echo "VLSI database filename expansion"<CR>

" <F7> Set wildcard settings to general defaults
  nmap <F7> :set suffixes=.exe,.dx,.o,.swp,.obj,.bak,~,.info<CR>:set wildignore=<CR>:echo "Default filename expansion"<CR>


" <F8> not usable in GUI (system catches this key)

" Switch dead-key mapping in and out with <F9>
" Note: <F9> is hardcoded in loaded scripts...
"  map <F9> :source $HOME/.vim/script/text_dead.vim<CR>
"  imap <F9> <ESC><F9>a

" Clear match highlighting
  map <F9> :match NONE<CR>
  imap <F9> <ESC><F9>a

" <F10> not usable in GUI (system catches this key)

" Remove temporarily search highlighting
  map <F11> :nohlsearch<CR>
  imap <F11> <ESC><F11>a

" <F12> - Show/Hide special characters (EOL, Tab etc.), change coloring
" Note: <F12> is hardcoded in loaded scripts...
  map <F12> :source $HOME/.vim/script/list_full.vim<CR>
  imap <F12> <ESC><F12>a

" +++++++++++++++++++++++++++++++++++++++++++++++++
" Temporary mappings
"
"map <F6> :s:[ 	]*\/\/ PMN [+-][ ]*::<CR>:nohlsearch<CR>0j
"map <F7> 0i//<ESC>80A <ESC>A// PMN -<ESC>080\|dw0j
"map <S-F7> 0i//<ESC>A // PMN -<ESC>0j
"map <F8> 80A <ESC>A// PMN +<ESC>080\|dw0j
"map <S-F8> A // PMN +<ESC>0j
"
" +++++++++++++++++++++++++++++++++++++++++++++++++

" Deleting text in normal mode
" using the BackSpace and Delete keys:
  nmap <BS>  X
  nmap <DEL> x

" Add backquote/quote to matching pairs
set matchpairs+=`:'

" From PMN environment
set bs=2                " allow backspacing over everything in insert mode
"set nobackup            " keep a backup file
set writebackup         " keep a backup until file properly saved, then automatically removed
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
                        " than 50 lines of registers
" Ignore white space differences for diff mode of vim
set diffopt=filler,iwhite

" Switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
  "syntax on      " Use standard color definition file
  syntax enable  " Use my own color definition file

  syntax sync minlines=150
  " Also switch on highlighting the last used search pattern.
  set hlsearch
  " and the currently performed search
  set incsearch

  colorscheme desert
	
endif

"hi PreProc  term=underline ctermfg=blue guifg=#ff80ff

augroup cprog
  " Remove all cprog autocommands
  au!

  " When starting to edit a file:
  "   For *.c and *.h files set formatting of comments and set C-indenting on.
  "   For other files switch it off.
  "   Don't change the order, it's important that the line with * comes first.
  autocmd BufRead *       set formatoptions=tcql nocindent comments&
  autocmd BufRead *.c,*.h set formatoptions=croql cindent comments=sr:/*,mb:*,el:*/,://
augroup END

"augroup gzip
"  " Remove all gzip autocommands
"  au!
"
"  " Enable editing of gzipped files
"  "	  read:	set binary mode before reading the file
"  "		uncompress text in buffer after reading
"  "	 write:	compress file after writing
"  "	append:	uncompress file, append, compress file
"  autocmd BufReadPre,FileReadPre	*.gz set bin
"  autocmd BufReadPost,FileReadPost	*.gz let ch_save = &ch|set ch=2
"  autocmd BufReadPost,FileReadPost	*.gz '[,']!gunzip
"  autocmd BufReadPost,FileReadPost	*.gz set nobin
"  autocmd BufReadPost,FileReadPost	*.gz let &ch = ch_save|unlet ch_save
"  autocmd BufReadPost,FileReadPost	*.gz execute ":doautocmd BufReadPost " . expand("%:r")
"
"  autocmd BufWritePost,FileWritePost	*.gz !mv <afile> <afile>:r
"  autocmd BufWritePost,FileWritePost	*.gz !gzip <afile>:r
"
"  autocmd FileAppendPre			*.gz !gunzip <afile>
"  autocmd FileAppendPre			*.gz !mv <afile>:r <afile>
"  autocmd FileAppendPost		*.gz !mv <afile> <afile>:r
"  autocmd FileAppendPost		*.gz !gzip <afile>:r
"augroup END
