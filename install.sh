defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
brew install neovim;
brew install rg;
brew install fzf;
brew install the_silver_searcher
pip3 install --user pynvim;

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
# echo "bind-key C-Tab next-window; bind-key C-S-Tab previous-window;" > ~/.tmux.conf;
