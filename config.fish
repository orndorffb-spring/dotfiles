set -Ux TERM xterm-256color
set -Ux COLORTERM truecolor
fish_add_path "$HOME/.tmuxifier/bin"

alias nv="nvim"

alias t='tmux attach || tmux new-session'
alias tw='tmuxifier s work'
alias ta='tmux attach -t'
alias tn='tmux new-session'

alias dc='docker-compose'

alias tl='tmux list-sessions'

export VIMRUNTIME=$HOME/nvim/usr/share/nvim/runtime

function setup_fisher_and_nvm
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher  
  fisher install jorgebucaran/nvm.fish
end

starship init fish | source
