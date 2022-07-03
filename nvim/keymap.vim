" leaderを,に変更
let mapleader = "\<Space>"

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap <silent> jj <Esc>:<C-u>w<CR>
" 同上を日本語でも打てるように
inoremap <silent> っｊ <Esc>:<C-u>w<CR>

" ESCを2回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" japanese
nnoremap あ a
nnoremap い i
nnoremap う u
nnoremap お o
nnoremap っd dd
nnoremap っy yy

" window control
nnoremap <silent> <Leader>v :vs<CR>
nnoremap <silent> <Leader>s :sp<CR>
nnoremap <silent> <Leader>h <C-w>h
nnoremap <silent> <Leader>j <C-w>j
nnoremap <silent> <Leader>k <C-w>k
nnoremap <silent> <Leader>l <C-w>l
nnoremap <silent> <Leader>ｈ <C-w>h
nnoremap <silent> <Leader>ｊ <C-w>j
nnoremap <silent> <Leader>ｋ <C-w>k
nnoremap <silent> <Leader>ｌ <C-w>l

" rows and columns
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" 補完
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
