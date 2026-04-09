#!/usr/bin/env bash
# Install system dependencies required by plugins in this Neovim config.
# macOS / Homebrew. Run: ./scripts/install-deps.sh
#
# Each block notes which plugin(s) need the dependency. Comment out anything
# you don't use.

set -e

if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew is required. Install from https://brew.sh first."
  exit 1
fi

echo "==> Updating Homebrew"
brew update

# --- Core editor + search ---
brew install neovim          # the editor itself
brew install ripgrep         # telescope live_grep, general search
brew install fd              # telescope file finder
brew install fzf             # junegunn/fzf, junegunn/fzf.vim
# fzf shell integration — only run once (it appends to .zshrc each time)
if ! grep -q 'fzf' "${ZDOTDIR:-$HOME}/.zshrc" 2>/dev/null; then
  "$(brew --prefix)"/opt/fzf/install --all --no-bash --no-fish
fi
brew install cmake           # telescope-fzf-native build step, YCM build
# tree-sitter CLI — needed by nvim-treesitter (main branch) to compile parsers.
# Ships via npm, not brew (the brew formula is the library only).
if ! command -v tree-sitter >/dev/null 2>&1; then
  npm install -g tree-sitter-cli
fi
# universal-ctags (HEAD only on first install — avoids rebuilding on re-runs)
if ! brew list universal-ctags >/dev/null 2>&1; then
  brew install --HEAD universal-ctags
fi
brew install catimg          # image preview inside telescope
brew install gh              # tpope/vim-rhubarb (GitHub integration)

# --- vim-plug (plugin manager itself) ---
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# --- Node toolchain (markdown-preview, copilot, prettier, YCM frontend) ---
brew install node            # iamcco/markdown-preview.nvim, github/copilot.vim, prettier
brew install yarn            # markdown-preview.nvim install hook

# --- Python (YCM, ruff) ---
brew install python          # ycm-core/YouCompleteMe build, ruff
pip3 install --break-system-packages pynvim  # YCM / nvim python provider
brew install ruff            # ALE python linter+fixer

# --- Ruby (rubocop via bundler) ---
# Assumes you manage Ruby separately (rbenv/asdf). rubocop is expected to come
# from each project's Gemfile (`bundle exec rubocop`), per default_config.vim.

# --- SQL ---
brew install pgformatter     # ALE sql fixer

# --- Terraform ---
brew install terraform       # hashivim/vim-terraform, ALE terraform fixer

# --- Elixir ---
brew install elixir          # mhanberg/elixir.nvim

# --- JS formatters (global) ---
if command -v npm >/dev/null 2>&1; then
  npm install -g prettier    # ALE js/ts/vue/json/astro fixer
fi

# --- Optional: Dart/Flutter ---
# brew install --cask flutter  # dart-lang/dart-vim-plugin, hankchiutw/flutter-reload.vim

# --- Per-plugin post-install build steps ---
# These run inside cloned plugin directories. Safe to re-run.

# markdown-preview.nvim: needs node_modules in app/ (the prebuilt-binary
# install hook isn't reliable on every system).
MDP_APP="$HOME/.vim/plugged/markdown-preview.nvim/app"
if [ -d "$MDP_APP" ] && [ ! -d "$MDP_APP/node_modules" ]; then
  echo "==> Building markdown-preview.nvim"
  (cd "$MDP_APP" && npx --yes yarn install)
fi

echo
echo "==> Done. Next steps inside nvim:"
echo "    :PlugInstall    \" if you haven't yet"
echo "    :lua require('nvim-treesitter').install({'sql'})"
