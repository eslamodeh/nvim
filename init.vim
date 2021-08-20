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
  Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
  Plug 'kchmck/vim-coffee-script'
  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  Plug 'ap/vim-buftabline'
	" Git Diff
  Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	source $HOME/.config/nvim/which-key.vim
  " Theme
  Plug 'mhartington/oceanic-next'
  " Syntax checker
  Plug 'dense-analysis/ale'
  Plug 'luochen1990/rainbow'
  Plug 'slim-template/vim-slim'
call plug#end()


" custom settings
set number relativenumber
set nu rnu
let NERDSpaceDelims=1
set hidden
nnoremap <C-l> :bnext<CR>
nnoremap <C-h> :bprev<CR>

let g:EditorConfig_exec_path = './editorconfig'

set scrolloff=10

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
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'javascript': ['prettier']
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

" Copy to system clipboard by default
set clipboard=unnamedplus

" For RTL texts
set arabicshape!

" Rainbow config
let g:rainbow_active = 1
" git config
set diffopt+=vertical
nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" YCM config
" let g:ycm_key_list_stop_completion = ['<CR>']
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Vagrant and rspec (carwow specific)

:function Test_file()
:  if exists('$TMUX')
:    call system('tmux split -h "wow \"bundle exec rspec ' . expand('%') . ' --format documentation; read\""')
:  else
:    exe "! wow bundle exec rspec " . expand("%")
:  endif
:endfunction

:function Test_line()
:  if exists('$TMUX')
:    call system('tmux split -h "wow \"bundle exec rspec ' . expand('%') . ':' . line('.') . ' --format documentation; read\""')
:  else
:    exe "! wow bundle exec rspec " . expand("%") . ":" . line(".")
:  endif
:endfunction
