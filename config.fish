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

alias lint-rb='git diff --name-only master | grep '\.rb$' | xargs bin/standardrb'

export VIMRUNTIME=$HOME/nvim/usr/share/nvim/runtime

function lint-rb
    git diff --name-only master | grep '\.rb$' | xargs bin/standardrb
end

function setup_fish_stuff
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher  
  fisher install jorgebucaran/nvm.fish
  curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
end

starship init fish | source
