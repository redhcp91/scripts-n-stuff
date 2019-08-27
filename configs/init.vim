"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" Sections:
"   ->  [1] General
"   ->  [2] NVIM user interface
"   ->  [3] Plugins
"   ->  [4] Colors and Fonts
"   ->  [5] Files and backups
"   ->  [6] Text, tab and indent related
"   ->  [7] Visual mode related
"   ->  [8] Moving around, tabs and buffers
"   ->  [9] Status line
"   -> [10] Editing mappings
"   -> [11] Spell checking
"   -> [12] Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [1] General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=5000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
"let mapleader = "Space"
"let g:mapleader = "Space"

let g:mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" RUN PYTHON SCRIPT WITH F9
nnoremap <buffer> <F9> :exec '!python' shellescape(@%, 1)<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [2] VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Always show current position
set ruler

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Show line numbers
set number

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
set foldcolumn=1

" Set GUI font
set guifont=Hack:10


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [3] Plugins 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a plugin directory
call plug#begin('/home/chris/.config/nvim/plugged')


""" DEOPLETE
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

Plug 'zchee/deoplete-jedi'


Plug 'scrooloose/nerdtree',
Plug 'roxma/vim-hug-neovim-rpc',
Plug 'tpope/vim-surround',
Plug 'vim-airline/vim-airline',
Plug 'vim-airline/vim-airline-themes',
Plug 'sheerun/vim-polyglot',
Plug 'vim-scripts/bash-support.vim',
Plug 'klen/python-mode', { 'branch': 'develop' }
Plug 'mcchrish/nnn.vim',
"Plug 'valloric/youcompleteme',
"Plug 'roxma/nvim-yarp',
"Plug 'scrooloose/syntastic',
"Plug '',
"Plug 'w0rp/ale',
"Plug '',
"Plug '',
"Plug '',
"Plug '',

" COLORSCHEME PLUGINS
Plug 'iCyMind/NeoSolarized',
Plug 'morhetz/gruvbox',
Plug 'mhartington/oceanic-next',
Plug 'joshdick/onedark.vim',
Plug 'ajmwagar/vim-deus',
Plug 'whatyouhide/vim-gotham',
Plug 'YorickPeterse/happy_hacking.vim',
Plug 'chriskempson/base16-vim',
Plug 'dracula/vim',
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
Plug 'tyrannicaltoucan/vim-deep-space', { 'as': 'deep-space' }
Plug 'danilo-augusto/vim-afterglow',
Plug 'google/vim-colorscheme-primary',
"Plug '',
"Plug '',
"Plug '',
"Plug '',

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [4] Plugin Options 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" nnn.vim
let g:nnn#set_default_mappings = 0
nnoremap <silent> <leader>nn :NnnPicker<CR>
nnoremap <leader>n :NnnPicker '%:p:h'<CR>


" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:python_host_prog  = '/usr/bin/python2.7'
let g:python3_host_prog  = '/usr/bin/python3.6'



" Python-Mode
" turn on pymode
let g:pymode = 1
let g:pymode_options = 1
    "use python3 syntax
let g:pymode_python = 'python3'
    "turn on run code script
let g:pymode_run = 1
    "bind key to run code
let g:pymode_run_bind = '<leader>r'



"NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0



" Base-16 colors
let base16colorspace=256



" Gruvbox Config
let g:gruvbox_italic = 1



" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1


" Jedi
"let g:jedi#auto_initialization = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [5] Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

set t_Co=256

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"

let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark

colorscheme deus

set termguicolors
let g:deus_termcolors=256



" Set color scheme
"colorscheme NeoSolarized
"colorscheme OceanicNext
"colorscheme gruvbox
"colorscheme onedark
"colorscheme gotham
"colorscheme gotham256
"colorscheme deus
"colorscheme happy_hacking
"colorscheme base16-vim
"colorscheme dracula 
"colorscheme challenger_deep
"colorscheme deep-space
"colorscheme afterglow
"colorscheme primary

"colorscheme deus

" BASE-16 COLORS
"colorscheme base16-flat
"colorscheme base16-google-dark
"colorscheme base16-google-light
"colorscheme base16-solarized-dark
"colorscheme base16-gruvbox-dark-hard
"colorscheme base16-gruvbox-dark-medium
"colorscheme base16-gruvbox-dark-pale
"colorscheme base16-gruvbox-dark-soft
"colorscheme base16-xcode-dusk
"colorscheme base16-porple
"colorscheme base16-seti
"colorscheme base16-outrun-dark
"colorscheme base16-zenburn


" Set extra options when using a GUI
if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Enable 256 colors palette in Gnome Terminal
"if $COLORTERM == 'terminator'
"    set t_Co=256
"endif

" Enable 256 colors palette in Gnome Terminal
"if $COLORTERM == 'gnome-terminal'
"    set t_Co=256
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [6] Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [7] Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

set clipboard=unnamedplus


""""""""""""""""""""""""""""""
" => [8] Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [9] Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable mouse support to change cursor position
set mouse=a

" Map split
nnoremap <C-e> :vsplit <CR>
nnoremap <C-o> :split <CR>

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif





""""""""""""""""""""""""""""""
" => [10] Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"set statusline=\ %f\ \ \Line:\ %l\ \ Column:\ %c\ \ Type:\%y\ \ Perc:\%P


" Format the status line
"set statusline=\Line:\ %l\ \ Column:\ %c\ -\ FType:\ %y
"set statusline=\Ln:\ %l
"set statusline+=\ Col:\ %c
"set statusline+=\ type:\%y
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

" Format the status line
"set statusline=\ CWD:\ %r%{getcwd()}%h\ \ \Line:\ %l\ \ Column:\ %c\ -\ FType:\ %y

"set statusline=\ %f\ Line&Column:\(%l,%c)\ \ FType:\ %y\ \ Perc:\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set spell
set spelllang=en
set spellfile=/home/chris/.config/nvim/spell/en.utf-8.add


" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => [11] Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Put these lines at the very end of your vimrc file.

" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL

