autoload -Uz colors && colors

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY

alias vi='nvim'

alias gs='git status'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

alias oi='cd ~/Projects/OI' 

PROMPT=$'\n%F{blue}%~%f\n%(?.%F{magenta}.%F{red})❯❯%f '

if [[ -o interactive ]]; then
    fastfetch
fi
