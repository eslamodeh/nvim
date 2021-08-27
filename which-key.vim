Plug 'liuchengxu/vim-which-key'
let g:which_key_map =  {}
let g:mapleader = "\<Space>"
" let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" let g:which_key_map['w'] = {
"       \ 'name' : '+windows' ,
"       \ 'w' : ['<C-W>w'     , 'other-window']          ,
"       \ 'd' : ['<C-W>c'     , 'delete-window']         ,
"       \ '-' : ['<C-W>s'     , 'split-window-below']    ,
"       \ '|' : ['<C-W>v'     , 'split-window-right']    ,
"       \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
"       \ 'h' : ['<C-W>h'     , 'window-left']           ,
"       \ 'j' : ['<C-W>j'     , 'window-below']          ,
"       \ 'l' : ['<C-W>l'     , 'window-right']          ,
"       \ 'k' : ['<C-W>k'     , 'window-up']             ,
"       \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
"       \ 'J' : [':resize +5'  , 'expand-window-below']   ,
"       \ 'L' : ['<C-W>5>'    , 'expand-window-right']   ,
"       \ 'K' : [':resize -5'  , 'expand-window-up']      ,
"       \ '=' : ['<C-W>='     , 'balance-window']        ,
"       \ 's' : ['<C-W>s'     , 'split-window-below']    ,
"       \ 'v' : ['<C-W>v'     , 'split-window-beside']    ,
"       \ '?' : ['Windows'    , 'fzf-window']            ,
"       \ }

let g:which_key_map['s'] = {
      \ 'name': "Search",
      \ 'f' : [':GFiles --cached --others --exclude-standard'    , 'Search files exclude gitignore'],
      \ 'a' : [':GFiles --cached --others'    , 'Search files'],
      \ 'w' : [':Ag', "Search word"],
      \ 'd' : [':NERDTreeFind', 'Toggle current file'],
      \ 't' : [':NERDTreeToggle', 'Toggle root directory']
      \ }

let g:which_key_map['t'] = {
      \ 'name': "Test",
      \ 'f' : [':call Test_file()'    , 'Run all spec for this file'],
      \ 'l' : [':call Test_line()'    , 'Run spec for current line'],
      \ }

autocmd VimEnter * call which_key#register('<Space>', "g:which_key_map")
