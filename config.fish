alias nv="nvim"

# Some tmux-related shell aliases

# Attaches tmux to the last session; creates a new session if none exists.
alias t='tmux attach || tmux new-session'

# Attaches tmux to a session (example: ta portal)
alias ta='tmux attach -t'

# Creates a new session
alias tn='tmux new-session'

alias dc='docker-compose'

# Lists all ongoing sessions
alias tl='tmux list-sessions'

export VIMRUNTIME=$HOME/nvim/usr/share/nvim/runtime

starship init fish | source