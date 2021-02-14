call plug#begin('~/.vim/plugged')
	" On-demand loading
	Plug 'preservim/nerdcommenter'
	Plug 'editorconfig/editorconfig-vim'
	Plug 'scrooloose/nerdtree'
	Plug 'liuchengxu/vim-which-key'

	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'junegunn/fzf.vim'

	Plug 'mg979/vim-visual-multi', {'branch': 'master'}

	Plug 'ericbn/vim-relativize'

	" code suggestion
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
	Plug 'ap/vim-buftabline'
	" Git Diff
	Plug 'airblade/vim-gitgutter'
	source $HOME/.config/nvim/which-key.vim
  " Theme
  Plug 'mhartington/oceanic-next'
  " Syntax checker
  Plug 'dense-analysis/ale'
call plug#end()


" custom settings
set number relativenumber
set nu rnu
let NERDSpaceDelims=1
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

let g:EditorConfig_exec_path = './editorconfig'

" Theme purposes
" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Or if you have Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax enable
colorscheme OceanicNext
" ALE config
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

" Copy to system clipboard by default
set clipboard=unnamedplus

" For RTL texts
set arabicshape!
