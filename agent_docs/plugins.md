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
- `nvim-treesitter/nvim-treesitter` — on the **`main`** branch (new API). Parsers installed via `require('nvim-treesitter').install({...})` in `lua/plugins/nvim-treesitter.lua`. Currently: `sql`, `markdown`, `markdown_inline`. _Deps: `tree-sitter` CLI, C compiler (`xcode-select --install`)_
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
- `MeanderingProgrammer/render-markdown.nvim` — in-editor rendering of headings, code blocks, lists, links, etc. Always-on for `markdown` filetype. Setup in `lua/plugins/render-markdown.lua`. _Deps: `markdown` + `markdown_inline` treesitter parsers, a Nerd Font in the terminal (icons fall back to `?` boxes without one)._
- **Browser preview** via `grip` (not an nvim plugin). `<leader>fp` in a `.md` buffer runs `grip <file> --browser` via `jobstart`, which boots a local server at `http://localhost:6419` rendering through GitHub's API. _Deps: `grip` (brew). Stop with `pkill grip`._

## Gotchas

- **grip rate limit**: GitHub allows ~60 unauthenticated render calls/hour. For heavier use, add a token to `~/.grip/settings.py` (`USERNAME` + `PASSWORD = 'ghp_...'`) to lift it to 5000/hr. Pass `--user-content` to render fully offline.
- **grip port reuse**: re-running `<leader>fp` while a previous grip is alive fails to bind port 6419 — kill the old one first.
- **Nerd Font glyphs**: render-markdown icons (and airline powerline) need a Nerd Font in the terminal. iTerm2 profile in `dotfiles/.iterm2_profile.json` is set to `JetBrainsMonoNLNerdFont-Regular`; install via `brew install --cask font-jetbrains-mono-nerd-font`.
- **YCM** is heavy and has a Python install step; needs Xcode CLT.
- **telescope-fzf-native** needs `cmake` available on PATH.
- **ALE rubocop** uses `bundle exec`, so it needs a Gemfile with rubocop in the project.
