" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" File tree
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Comment in/out
Plug 'tpope/vim-commentary'

" Surrounding
Plug 'tpope/vim-surround'

" Indent color
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
set ts=4 sw=4 et
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1

" Lsp
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" Auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Bracket
Plug 'luochen1990/rainbow'
let g:rainbow_active = 1
let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'luna'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab

" Icon
Plug 'ryanoasis/vim-devicons'

call plug#end()

"
" SETTING
"
"" Set the character code to UFT-8.
set fenc=utf-8
" Don't create backup files.
set nobackup
" Don't create swap files.
set noswapfile
" Automatically reread a file you are editing when it is changed.
set autoread
" Allow buffers to open other files while they are being edited.
set hidden
" Displays the status of the command being entered.
set showcmd
" Enable backspace in insert mode
set backspace=indent,eol,start

"
" APPEARANCE
"
" Display line numbers
set number
" Highlight the current line
set cursorline
" Highlight the current line (vertically)
set cursorcolumn
" The cursor can now be moved to one character ahead of the end of the line.
set virtualedit=onemore
" Indents are smart indents.
set smartindent
" Visualize the beep.
set visualbell
" Display the corresponding parentheses when entering parentheses.
set showmatch
" Always show the status line
set laststatus=2
" Command Line Completion
set wildmode=list:longest
" Enable to move the line in the display unit when wrapping.
nnoremap j gj
nnoremap k gk
" Enabling syntax highlighting.
syntax enable

"
" TAB
"
" Set Tab characters to half-width spaces.
set expandtab
" Display width of Tab characters other than those at the beginning of a
" line (how many spaces).
set tabstop=2
" Display width of the Tab character at the beginning of a line
set shiftwidth=2

"
" SEARCH
"
" If the search string is lower case, the search is case-insensitive.
set ignorecase
" If a search string contains uppercase letters, it is searched separately.
set smartcase
" Sequentially hits the target string when entering a search string.
set incsearch
" Go back to the beginning when you reach the end of the search
set wrapscan
" Highlight the search term
set hlsearch
" Release the highlighting by pressing ESC.
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"
" ORIGINAL
"
" While searching in ripgrep, press ? to preview the search in ripgrep.
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\ 'rg --column --line-number --hidden --ignore-case --no-heading --color=always '.shellescape(<q-args>), 1,
\ <bang>0 ? fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'up:60%')
\ : fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%:hidden', '?'),
\ <bang>0)
