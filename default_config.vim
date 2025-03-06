" To install highligher, use TSInstall lange -> EX: :TSInstall all

" Custom settings
set number relativenumber
set nu rnu
set list listchars=tab:>-,trail:.,extends:>,precedes:<
set hidden
set noincsearch

" Theme
colorscheme tokyonight-night

" Lua requires
lua require('nvim-treesitter.configs').setup {}
lua require('telescope_config')
" lua require("elixir").setup()

" Nerd tree config
let NERDSpaceDelims=1
let NERDTreeShowHidden=1

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


" ALE config
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1
let g:ale_linters_explicit = 1

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_linters = {
\   'ruby': ['rubocop'],
\   'python': ['ruff'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vue': ['prettier'],
\   'json': ['prettier'],
\   'astro': ['prettier'],
\   'sql': ['pgformatter'],
\   'terraform': ['terraform'],
\}

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'python': ['ruff'],
\   'ruby': ['rubocop'],
\   'javascript': ['prettier'],
\   'typescript': ['prettier'],
\   'vue': ['prettier'],
\   'json': ['prettier'],
\   'astro': ['prettier'],
\   'sql': ['pgformatter'],
\   'terraform': ['terraform'],
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
" inoremap <expr> <C-j> pumvisible() ? "\<C-N>" : "j"
" inoremap <expr> <C-k> pumvisible() ? "\<C-P>" : "k"
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1

" Vagrant and rspec
set foldmethod=indent
set foldnestmax=10
" set nofoldenable
set foldlevel=2

" Theme
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'atomic'
let g:airline_powerline_fonts = 1
