call plug#begin('~/.vim/plugged')
let mapleader = ","
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'liuchengxu/vim-which-key'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'ericbn/vim-relativize'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
" Plug 'ryanoasis/vim-devicons' Icons without colours
Plug 'akinsho/nvim-bufferline.lua'

" cusrom mapping
" map <C-p> :Files<CR>
" map <C-b> :NERDTreeToggle<CR>
" map <C-f> :Rg<CR>
" custom settings
set number relativenumber
set nu rnu

source $HOME/.config/nvim/which-key.vim 
call plug#end()
