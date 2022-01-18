defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
brew install neovim;

brew install cmake python mono go nodejs; # for YCM
echo '{
   "libs": [
     "browser",
     "react"
   ],
   "plugins": {
       "doc_comment": null,
       "angular": {},
       "node": {}
   }
 }' > ~/.tern-project;

brew install fzf;
pip3 install --user pynvim;
brew install --HEAD universal-ctags/universal-ctags/universal-ctags;
npm install -g elm elm-test elm-oracle elm-format;

curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install
cp .editorconfig ~/
