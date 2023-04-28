function Test_file()
  let current_file = expand('%')
  " let file_name = split(current_file, "\\.")[0]

  if current_file !~ "spec/.*.rb"
    lua require("notify")("Can't run tests for this file..", "error")
    return
  endif

  if exists('$TMUX')
    call system('tmux split -h "bundle exec rspec ' . current_file . ' --format documentation; read"')
  else
    exe "! bundle exec rspec " . current_file
  endif
endfunction

function Test_line()
  let current_file = expand('%')
  " let file_name = split(current_file, "\\.")[0]

  if current_file !~ "spec/.*.rb"
    lua require("notify")("Can't run test for this line..", "error")
    return
  endif

  if exists('$TMUX')
    call system('tmux split -h "bundle exec rspec ' . current_file . ':' . line('.') . ' --format documentation; read"')
  else
    exe "! bundle exec rspec " . current_file . ":" . line(".")
  endif
endfunction
