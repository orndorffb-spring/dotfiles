session_root "/workspaces/development-space"
if initialize_session "work"; then

  new_window "rotom"
  run_cmd "cd rotom && rvm use && clear"
  split_h 50
  run_cmd "cd rotom && rvm use && clear"
  select_pane 0
  run_cmd "hx ."

  new_window "ehr-api"
  run_cmd "cd ehr-api && rvm use && clear"
  split_h 50
  run_cmd "cd ehr-api && rvm use && clear"
  select_pane 0
  run_cmd "hx ."

  new_window "diglet"
  run_cmd "cd diglet && php artisan serve --port=8081"
  run_cmd "hx ."

  new_window "fe"

  new_window "ports"
  run_cmd "bash -c '.devcontainer/publish-ports.sh'"

  select_window 1

fi
finalize_and_go_to_session
