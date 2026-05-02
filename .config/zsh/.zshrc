autoload -U colors && colors
bindkey -e
PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "
source <(fzf --zsh)
finder() {
    open .
}
mkcd() {
    mkdir -p "$1" && cd "$1"
}

zle -N finder
bindkey '^f' finder
alias f='fzf'
alias vim='nvim'
alias matlab='/Applications/MATLAB_R2024a.app/bin/matlab -nodesktop'
