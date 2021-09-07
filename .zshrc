# Custom aliases
alias please="sudo"
alias rs="rails s"
alias rc="rails c"
alias nv="nvim ."
export EDITOR='nvim'
export ZSH="/Users/${USER}/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval "$(rbenv init -)"
