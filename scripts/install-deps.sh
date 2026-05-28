#!/usr/bin/env bash
# All dependencies required to run this Neovim config and its plugins.
# macOS / Homebrew.

set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required. Install from https://brew.sh first."
  exit 1
fi

# --- Editor itself ---
brew install neovim

# --- Search / file pickers (telescope, fzf.vim) ---
brew install ripgrep         # telescope live_grep
brew install fd              # telescope file finder
brew install fzf             # junegunn/fzf, junegunn/fzf.vim
# fzf shell integration — only run once (appends to .zshrc each time)
if ! grep -q 'fzf' "${ZDOTDIR:-$HOME}/.zshrc" 2>/dev/null; then
  "$(brew --prefix)"/opt/fzf/install --all --no-bash --no-fish
fi

# --- Build tools (YCM, telescope-fzf-native, tree-sitter parsers) ---
brew install cmake
brew install gh              # tpope/vim-rhubarb (GitHub integration)
# universal-ctags (HEAD only on first install — avoids rebuilding on re-runs)
if ! brew list universal-ctags >/dev/null 2>&1; then
  brew install --HEAD universal-ctags    # ludovicchabant/vim-gutentags
fi
brew install catimg          # telescope image preview

# --- vim-plug (plugin manager) ---
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# --- Node toolchain (copilot, tree-sitter-cli host) ---
brew install node            # github/copilot.vim
if ! command -v tree-sitter >/dev/null 2>&1; then
  npm install -g tree-sitter-cli   # nvim-treesitter (main branch) parser compiler
fi

# --- Python (YCM, ruff, pynvim) ---
brew install python
pip3 install --break-system-packages pynvim   # YCM / nvim python provider
brew install ruff            # ALE python fixer

# --- ALE / language-specific tooling ---
brew install prettier        # ALE js/ts/vue/json/astro fixer
brew install pgformatter     # ALE sql fixer
brew install terraform       # hashivim/vim-terraform + ALE terraform fixer
brew install elixir          # mhanberg/elixir.nvim

# --- Markdown preview (<leader>fp) ---
brew install grip            # GitHub-rendered markdown at http://localhost:6419

# --- Nerd Font (render-markdown glyphs + airline powerline) ---
brew install --cask font-jetbrains-mono-nerd-font
