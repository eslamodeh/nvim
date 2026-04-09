# Plugins

Grouped as they appear in `init.vim`. Each entry lists system dependencies (installed via `scripts/install-deps.sh`).

## Core / utilities
- `nvim-lua/plenary.nvim` — Lua utility lib (dep of telescope, etc.). _Deps: none_
- `preservim/nerdcommenter` — comment toggling. _Deps: none_
- `editorconfig/editorconfig-vim` — `.editorconfig` support. _Deps: none_
- `scrooloose/nerdtree` — file tree. _Deps: none_
- `liuchengxu/vim-which-key` — leader key menu (configured in `which-key.vim`). _Deps: none_
- `junegunn/fzf` + `junegunn/fzf.vim` — fuzzy finder. _Deps: `fzf`_

## UI
- `rcarriga/nvim-notify` — notifications. _Deps: none_
- `ericbn/vim-relativize` — relative numbers helper. _Deps: none_
- `folke/tokyonight.nvim` — colorscheme (`tokyonight-night` set in `default_config.vim`). _Deps: none_
- `vim-airline/vim-airline` + themes — statusline (`atomic` theme). _Deps: a Nerd Font for `powerline_fonts`_

## Completion / LSP-ish
- `ycm-core/YouCompleteMe` — completion. _Deps: `python`, `cmake`, build tools (`xcode-select --install`)_
- `mhanberg/elixir.nvim` — Elixir tooling. _Deps: `elixir`_

## Git
- `airblade/vim-gitgutter` — _Deps: `git`_
- `tpope/vim-fugitive` — _Deps: `git`_
- `tpope/vim-rhubarb` — _Deps: `gh` (optional, for GitHub integration)_

## Syntax / linting
- `nvim-treesitter/nvim-treesitter` — on the **`main`** branch (new API). Parsers installed via `require('nvim-treesitter').install({...})` in `lua/plugins/nvim-treesitter.lua`. Currently: `sql`. _Deps: `tree-sitter` CLI, C compiler (`xcode-select --install`)_
- `dense-analysis/ale` — linting/fixing. Heavy config block in `default_config.vim`. _Deps: see per-language fixers below_
  - ruby → `bundle exec rubocop` (per-project Gemfile)
  - python → `ruff`
  - js/ts/vue/json/astro → `prettier` (npm global)
  - sql → `pgformatter`
  - terraform → `terraform`
- `wuelnerdotexe/vim-astro` — Astro syntax. _Deps: none_

## Tags / language-specific
- `ludovicchabant/vim-gutentags` — _Deps: `universal-ctags`_
- `dart-lang/dart-vim-plugin` — _Deps: `dart` / `flutter`_
- `hankchiutw/flutter-reload.vim` — _Deps: `flutter`_

## Search
- `nvim-telescope/telescope.nvim` (pinned to `0.1.8`) — _Deps: `ripgrep`, `fd`_
- `nvim-telescope/telescope-fzf-native.nvim` — _Deps: `cmake`, C compiler_

## Terraform
- `hashivim/vim-terraform` — _Deps: `terraform`_
- `vim-syntastic/syntastic` — _Deps: per-language linters_
- `juliosueiras/vim-terraform-completion` — _Deps: `terraform`_

## AI
- `github/copilot.vim` — _Deps: `node` (>=18), GitHub Copilot subscription, run `:Copilot setup`_

## Markdown
- `iamcco/markdown-preview.nvim` — browser-based live preview. Install hook: `{ -> mkdp#util#install() }`. _Deps: `node`, `yarn`. Commands: `:MarkdownPreview`, `:MarkdownPreviewStop`._

## Gotchas

- **markdown-preview.nvim** needs its `app/bin/` binary downloaded. If `:MarkdownPreview` does nothing, `app/bin/` is missing — run `:call mkdp#util#install()` or `~/.vim/plugged/markdown-preview.nvim/app/install.sh` manually. Avoid the `'for':` lazy-load option, it's known to break the install hook.
- **YCM** is heavy and has a Python install step; needs Xcode CLT.
- **telescope-fzf-native** needs `cmake` available on PATH.
- **ALE rubocop** uses `bundle exec`, so it needs a Gemfile with rubocop in the project.
