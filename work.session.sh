session_root "/workspaces/development-space"
if initialize_session "work"; then

  new_window "rotom"
  run_cmd "cd rotom && clear"
  split_v 50
  run_cmd "cd rotom && clear"
  select_pane 0
  run_cmd "hx ."

  new_window "ehr-api"
  run_cmd "cd ehr-api && clear"
  split_v 50
  run_cmd "cd ehr-api && clear"
  select_pane 0
  run_cmd "hx ."

  select_window 1

fi
finalize_and_go_to_session
