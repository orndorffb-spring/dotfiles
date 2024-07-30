session_root "/workspaces/development-space"
if initialize_session "work"; then

  new_window "rotom"
  run_cmd "cd rotom"
  run_cmd "clear"

  new_window "ehr"
  run_cmd "cd ehr-api"
  run_cmd "clear"

  select_window 1

fi
finalize_and_go_to_session
