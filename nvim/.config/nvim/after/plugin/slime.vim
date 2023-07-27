let g:slime_target = 'tmux'
" let g:slime_no_mappings = 'true'
let g:slime_dont_ask_default = 1
let b:slime_default_config = {"socket_name": "default", "target_pane": "{last}"}
let g:slime_paste_file = tempname()

function SlimeOverride_EscapeText_sql(text)
  return system(g:python3_host_prog . ' ' . stdpath('config') . '/scripts/slime_format_sql.py', a:text)
endfunction
