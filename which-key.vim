Plug 'liuchengxu/vim-which-key'

let g:which_key_map =  {}
let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

let g:which_key_map['s'] = {
      \ 'name': "Search",
      \ 'f' : [':Telescope find_files'    , 'Search files exclude gitignore'],
      \ 'w' : [':Telescope live_grep', "Search word"],
      \ 'd' : [':NERDTreeFind', 'Toggle current file'],
      \ 't' : [':NERDTreeToggle', 'Toggle root directory']
      \ }

let g:which_key_map['r'] = {
      \ 'name': "Replace",
      \ 'a' : [':Farr'    , 'Replace'],
      \ }

function! FilePreview() abort
  if &filetype ==# 'markdown'
    MarkdownPreview
  else
    echo "No preview available for filetype: " . &filetype
  endif
endfunction

let g:which_key_map['f'] = {
      \ 'name': "File",
      \ 'p' : [':call FilePreview()', 'Preview current file'],
      \ }

let g:which_key_map['t'] = {
      \ 'name': "Test",
      \ 'f' : [':call Test_file()'    , 'Run all spec for this file'],
      \ 'l' : [':call Test_line()'    , 'Run spec for current line'],
      \ }

autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")
