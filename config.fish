set -Ux TERM xterm-256color
set -Ux COLORTERM truecolor
set -gx EDITOR hx
fish_add_path "$HOME/.tmuxifier/bin"

alias nv="nvim"

alias t='tmux attach || tmux new-session'
alias tw='tmuxifier s work'
alias ta='tmux attach -t'
alias tn='tmux new-session'

alias dc='docker-compose'

alias tl='tmux list-sessions'


export VIMRUNTIME=$HOME/nvim/usr/share/nvim/runtime

function lint-rb
    git diff --name-only master | grep '\.rb$' | xargs bin/standardrb --fix
end

function setup_fish_stuff
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
    fisher install jorgebucaran/nvm.fish
    curl -L --create-dirs -o ~/.config/fish/functions/rvm.fish https://raw.github.com/lunks/fish-nuggets/master/functions/rvm.fish
end

function get_access_token
    if test (count $argv) -lt 1
        echo "User name needs to be provided, @springhealth.com is appended automatically..." >&2
        return 1
    end

    curl 'diglet:8080/oauth/access_token' \
        -H 'accept: application/json, text/plain, */*' \
        -H 'content-type: application/json' \
        --data-raw '{"grant_type":"password","client_id":"bb96279d-65bb-4c90-91ed-e6c7e9ce4a70","client_secret":"'$EHR_TEST_DIGLET_SHAYMIN_SECRET'","scope":"group:admin group:medical_biller group:super_admin group:compass:care_provider group:compass:associate_provider group:compass:med_manager group:compass:coach group:compass:care_navigator group:compass:care_support_coordinator group:compass:admin group:compass:clinical_manager group:compass:clinical_support group:compass:super_admin group:compass:billing_specialist group:compass:care_consultant group:compass:care_advocate group:compass:group_practice_admin group:engineer","username":"'$argv[1]'@springhealth.com","password":"foobarbazz"}' | jq -r .access_token
end

function set_at
    set -gx access_token (get_access_token $argv[1])
end

function rotom_get
    if test (count $argv) -lt 1
        echo "Route needed" >&2
        return 1
    end

    curl --location 'http://localhost:4400/api/compass/'$argv[1]'' \
        --header 'Authorization: Bearer '$access_token'' | jq .
end

function clean_trace
    cat | jq 'del(.traces."Framework Trace", .traces."Full Trace")'
end

starship init fish | source
