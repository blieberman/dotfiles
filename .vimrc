if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
   set fileencodings=utf-8,latin1
endif

set nocompatible    " Use Vim defaults (much better!)
set bs=indent,eol,start     " allow backspacing over everything in insert mode
"set ai         " always set autoindenting on
"set backup     " keep a backup file
set viminfo='20,\"50    " read/write a .viminfo file, don't store more
            " than 50 lines of registers
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time

" Only do this part when compiled with support for autocommands
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif

if has("cscope") && filereadable("/usr/bin/cscope")
   set csprg=/usr/bin/cscope
   set csto=0
   set cst
   set nocsverb
   " add any database in current directory
   if filereadable("cscope.out")
      cs add cscope.out
   " else add database pointed to by environment
   elseif $CSCOPE_DB != ""
      cs add $CSCOPE_DB
   endif
   set csverb
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

if &term=="xterm"
     set t_Co=8
     set t_Sb=%dm
     set t_Sf=%dm
endif
if has('gui_running')
    set guifont=Menlo:h16
    set lines=60 columns=100
endif

filetype plugin on


" set color and font
colors lucius
syntax on
set enc=utf-8
set history=100
set tabstop=4
set shiftwidth=2
set smartindent
set expandtab
set wrapscan
set ignorecase
"set smartcase
set cursorline
set virtualedit=all
" Cool trick to show what you're replacing/changing
"set cpoptions+=$
set nobackup
set nowb
set noswapfile
set showcmd
set paste
set nowrap
syntax on
"status
set ch=2
"set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]\ %{fugitive#statusline()}
