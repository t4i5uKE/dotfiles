" Specify a directory for plugins
call plug#begin('~/.vim/plugged')
" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
let NERDTreeShowBookmarks=1
" Gitを便利に使う
Plug 'tpope/vim-fugitive'
" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'
" インデントに色を付けて見やすくする
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1
" ログファイルを色づけしてくれる
Plug 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
Plug 'bronson/vim-trailing-whitespace'
" less用のsyntaxハイライト
" Plug 'KohPoll/vim-less'
" CSVをカラム単位に色分けする
Plug 'mechatroner/rainbow_csv'
" ブロック移動の拡張
Plug 'andymass/vim-matchup'
" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }
" テーマ
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'wombat'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

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
" Visualize invisible characters (Tab will be displayed as '▸-').
set list listchars=tab:\▸\-
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
