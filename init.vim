call plug#begin('~/.vim/plugged')
	" On-demand loading
	Plug 'preservim/nerdcommenter'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'liuchengxu/vim-which-key'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	Plug 'ericbn/vim-relativize'

	" code suggestion
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

	Plug 'ap/vim-buftabline'
	" Git Diff
	Plug 'airblade/vim-gitgutter'
	source $HOME/.config/nvim/which-key.vim
	" source $HOME/.config/nvim/editor-config.vim
call plug#end()


" custom settings
set number relativenumber
set nu rnu
let NERDSpaceDelims=1
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

let g:EditorConfig_exec_path = './editorconfig'
set background=dark
