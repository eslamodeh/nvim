" Not required to be manually loaded
" lua require("notify").setup({ stages = "fade_in_slide_out", timeout = 1000 })
" To install highligher, use TSInstall lange -> EX: :TSInstall all
lua require('nvim-treesitter.configs').setup({ highlight={ enable=true } })

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
\   'javascript': ['prettier'],
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

" Vagrant and rspec
set foldmethod=indent
set foldnestmax=10
" set nofoldenable
set foldlevel=2