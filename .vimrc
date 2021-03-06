" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git wrapper so awesome, it should be illegal
Plugin 'tpope/vim-fugitive'
" A git commit browser in Vim
Plugin 'junegunn/gv.vim'
Plugin 'tpope/vim-surround'
" Commands for vim-surround
" cs"' :: Replace double quotes with single
" cs'" :: Replace single with double quotes
" ds"  :: Strip leading and trailing double quotes
" ysiw' :: Add single quotes to the current word
Plugin 'tpope/vim-repeat' 
" vim-repeat allows . to repeat changes to surrounding quotes

" rhubarb.vim: GitHub extension for fugitive.vim
Plugin 'tpope/vim-rhubarb'  

Plugin 'ctrlpvim/ctrlp.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-rails'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Shougo/neocomplete'
" Themes
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'

" Slim syntax highlight
Plugin 'slim-template/vim-slim.git'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'claco/jasmine.vim'
Plugin 'w0rp/ale' " Asynchronous Lint Engine
Plugin 'thoughtbot/vim-rspec'
Plugin 'rking/ag.vim' 
Plugin 'bling/vim-bufferline'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Commands for vim-rubyhash
" <leader>rt :: stringify keys with double quotes
" <leader>rs :: symbolize keys
" <leader>rq :: stringify keys with single quotes
" <leader>rr :: turns hash into new-style ruby hash
Plugin 'tomtom/tcomment_vim'
" Commands for tcomment_vim
" gcc :: Toggle comment for the curent line
" gc{motion} ::Toggle comments for motion

" A Vim plugin which shows a git diff in the 'gutter' (sign column)
Plugin 'airblade/vim-gitgutter'
"A vim plugin to display the indention levels with thin vertical lines
Plugin 'Yggdroot/indentLine'
" Insert or delete brackets, parens, quotes in pair
Plugin 'jiangmiao/auto-pairs'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"filetype plugin indent on    " required
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

set number
filetype plugin indent on    " Enable filetype-specific plugins, filetype-specific indenting

syntax on             " Enable syntax highlighting

let mapleader = ","

set autoindent
set showcmd
set wildmenu
set wildmode=list:longest
set title
set ruler
set hlsearch
set incsearch
set showmatch
set ignorecase
set smartcase
set hidden
set number
set hlsearch
set history=1000
set autoread
set undolevels=1000

set backupdir=/tmp   
set directory=/tmp "don't clutter my dirs with swp and tmp files

set backspace=indent,eol,start
set softtabstop=2
set shiftwidth=2
set expandtab
set ai 
set et
set background=dark
set foldmethod=indent

" Status line
set laststatus=2
set statusline=
set statusline+=%-3.3n\                      " buffer number
set statusline+=%F\                          " filename
set statusline+=%h%m%r%w                     " status flags
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type
set statusline+=%=                           " right align remainder
set statusline+=%-14(%l,%c%V%)               " line, character
set statusline+=%<%P                         " file position
set statusline+=%{fugitive#statusline()}

highlight StatusLine ctermfg=yellow

augroup ruby_setup
  autocmd!
  autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  autocmd BufNewFile,BufRead *.slim set ft=slim
augroup END
                
" function! <SID>StripTrailingWhitespaces()
"   let l = line(".")
"   let c = col(".")
"   %s/\s\+$//ge
"   call cursor(l, c)
" endfunction
"
" autocmd FileType ruby,eruby,cucumber,spec autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" Disable AutoComplPop. 
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1

" switch windows with <leader> w
nmap <leader>w <C-w><C-w>

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" NERDTreeTabs Toggle  
map <C-n> :NERDTreeToggle<CR>
" take me to the file location, now!
nmap <leader>f :NERDTreeFind<CR>
let g:NERDTreeDirArrows=0

" weird chars fix
let g:auto_type_info=0

" tab 
nnoremap <C-t>     :tabnew<CR>

" clear highlighting
map <C-h> :nohl<CR>

" ctrl-s to save
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Yggdroot/indentLine config
" let g:indentLine_char = '.'
let g:indentLine_enabled = 0

map <C-i> :IndentLinesToggle<CR>

" ctrlp configs
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_user_command = 'find %s -type f'  " MacOSX/Linux

" If ag is available use it as filename list generator instead of 'find'
if executable("ag")
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup  --ignore ''.git'' --ignore ''.DS_Store'' --ignore  ''node_modules'' --hidden -g ""'
endif

"Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>

" airline stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:bufferline_echo = 0
let g:airline_theme='papercolor'
let g:airline_section_c = ''
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8

" Split resizing
nnoremap <S-Up> <C-W>-<C-W>-
nnoremap <S-Down> <C-W>+<C-W>+
nnoremap <S-Left> <C-W>><C-W>>
nnoremap <S-Right> <C-W><<C-W><

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif

" when to jump to the next line
if exists("&colorcolumn")
  set colorcolumn=80
endif

" change double to single quotes
nmap <leader>' cs"'

" change single to double quotes
nmap <leader>" cs"'

" allow semicolon to serve as colon
nnoremap ; :

" faster ways to get out of insert mode
imap ;; <esc>

" also works in visual mode
vmap ;; <esc>

" http://vimcasts.org/episodes/accessing-the-system-clipboard-from-vim/

" copy to OS clipboard.
nmap <leader>y "+y
vmap <leader>y "+y
nmap <leader>yy "+yy

" paste from OS clipboard
nmap <leader>p "+p
nmap <leader>P "+P
vmap <leader>p "+p
vmap <leader>P "+P"`"`"

" ale configs
let g:ale_lint_on_text_changed="never"
let g:ale_lint_on_enter=0
map <Leader>a :ALELint<CR>


" let g:solarized_termcolors=256
" colorscheme papercolor
