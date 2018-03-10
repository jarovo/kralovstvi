set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'python-rope/ropevim'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'altercation/vim-colors-solarized'


" Bundle "tobyS/skeletons.vim"
" Plugin 'SirVer/ultisnips'
" Plugin 'honza/vim-snippets'

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"set termencoding=utf-8
"set encoding=utf-8

let g:airline_powerline_fonts = 1

"set guifont=terminus\ 12
"set guifont=Monospace\ 12
" set guifont=Fixed\ Semi-Condensed\ 13
" set guifont=-misc-fixed-medium-r-normal-*-18-120-100-100-c-90-iso10646-1
" set guifontwide=-misc-fixed-medium-r-normal-*-18-120-100-100-c-180-iso10646-1
"set guifont=DeJaVu\ Sans\ Mono\ 11
set guifont=Hack\ 11


set hlsearch
set nonumber
set showmatch
set mousehide
set ruler
set rulerformat=%3b\ \ %l,%c%V%=%P
set cursorcolumn
set cursorline
set colorcolumn=79

colorscheme solarized
set background=dark

" Automatic synax highlighting
syntax on
let c_comment_strings=1

"set autowrite
set tabstop=4
set shiftwidth=4
set expandtab
set shiftround
"set lines=35
"set columns=120
set smarttab
set autoindent
set smartindent
set expandtab

set showbreak=>>\ \|
set linebreak
set scrolloff=5 " Rows from cursor to screenedges
set sidescroll=5
"set backspace=indent,eol,start "erasing all

"set textwidth=78
set formatoptions=qtcrown1lv

autocmd FileType text setlocal formatoptions=qtcrown1a

" set foldcolumn=4

" Backups settings
set backup
set backupdir=~/.vim/backup,.,~/

" Temp
set directory=~/.vim/tmp,.,/tmp

" :w and :e confirms
set confirm

" History saves
set viminfo='50,\"500
set history=50

" Searching autocompletes
set incsearch
set wildchar=<Tab>
set wildmenu
set wildmode=longest:full,full

" Show some characters "
set listchars=tab:░░,eol:$,precedes:>,trail:_

" HTML, ...
filetype plugin on
filetype indent on

" Statusline
set laststatus=2
set statusline=%1*%n:%*\ %<%f\ %y%m%2*%r%*%=[%b,0x%B]\ \ %l/%L,%c%V\ \ %P
highlight User1 guibg=white guifg=blue
highlight User2 guibg=white guifg=red
set showcmd

"  GUI
set guioptions=agimrtTb

" Printing
set printexpr=PrintFile(v:fname_in)
function PrintFile(fname)
    call system("evince " . a:fname)
    call delete(a:fname)
    return v:shell_error
endfunc

" ClipRegist
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc> " p pastes into choosed 
set clipboard=unnamed

" vim -b : edit binary using xxd-format!
" augroup Binary
" 	au!
" 	au BufReadPre  *.bin let &bin=1
" 	au BufReadPost *.bin if &bin | %!xxd
" 	au BufReadPost *.bin set ft=xxd | endif
" 	au BufWritePre *.bin if &bin | %!xxd -r
" 	au BufWritePre *.bin endif
" 	au BufWritePost *.bin if &bin | %!xxd
" 	au BufWritePost *.bin set nomod | endif
" augroup END

" Last Position
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif


" source /usr/lib/python2.7/site-packages/ropevim-0.3_rc-py2.7.egg/ropevim.vim
" let ropevim_vim_completion=1
" let ropevim_extended_complete=1
" let g:ropevim_autoimport_modules = ["os", "shutil"]

"hi CursorColumn guibg=#111 gui=None
"hi CursorLine guibg=#111  gui=None
match Todo /\s\+$/


func GitGrep(...)
  let save = &grepprg
  set grepprg=git\ grep\ -n\ $*
  let s = 'grep'
  for i in a:000
    let s = s . ' ' . i
  endfor
  exe s
  let &grepprg = save
endfun
command -nargs=? G call GitGrep(<f-args>)

func GitGrepWord()
  normal! "zyiw
  call GitGrep('-w -e ', getreg('z'))
endf
nmap <C-x>G :call GitGrepWord()<CR>
nmap <F8> :TagbarToggle<CR>
