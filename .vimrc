" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" File tree
Plug 'scrooloose/nerdtree'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let g:NERDTreeShowHidden=1
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" Denite
let g:python3_host_prog = '/usr/local/bin/python3'

" Git
Plug 'tpope/vim-fugitive'
command Gst :Gstatus
command Gdf :Gdiff
command Gbl :Gblame

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
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <C-]> <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  nmap <buffer> <Leader>d <plug>(lsp-type-definition)
  nmap <buffer> <Leader>r <plug>(lsp-references)
  nmap <buffer> <Leader>i <plug>(lsp-implementation)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_popup_delay = 200
let g:lsp_text_edit_enabled = 1
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_settings_filetype_go = ['gopls', 'golangci-lint-langserver']

let g:lsp_settings = {}
let g:lsp_settings['gopls'] = {
  \  'workspace_config': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \  'initialization_options': {
  \    'usePlaceholders': v:true,
  \    'analyses': {
  \      'fillstruct': v:true,
  \    },
  \  },
  \}

" Earthfile
Plug 'earthly/earthly.vim', { 'branch': 'main' }

" For snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

set completeopt+=menuone

" Auto complete
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim', { 'depends': 'fzf' }

" Theme
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
let g:airline_theme = 'angr'
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
