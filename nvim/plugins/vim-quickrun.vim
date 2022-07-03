"let g:quickrun_config = {
"    \ '_': {
"        \ 'runner' : 'vimproc',
"        \ 'runner/vimproc/updatetime' : 40,
"        \ 'outputter' : 'error',
"        \ 'outputter/error/success' : 'buffer',
"        \ 'outputter/error/error' : 'quickfix',
"        \ 'outputter/buffer/split' : ':botright 8sp',
"    \}
"}

let g:quickrun_no_default_key_mapping = 1
nnoremap <Leader>run :cclose<CR>:write<CR>:QuickRun -mode n<CR>
