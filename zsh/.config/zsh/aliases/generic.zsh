alias vim='nvim'
alias conf='vim ~/.zshrc'
#alias cat='bat'
alias wut='tldr'
alias lg="lazygit"
alias ld="lazydocker"
alias lq="lazysql"
alias x="exit"
alias conn="host=$(grep \"^Host \" ~/.ssh/config | awk '{print $2}' | fzf) && ssh \"$host\""
