function Test_file()
  let currentFile = expand('%')

  if currentFile =~ "spec/.*.rb"
    call RspecTest(currentFile)
  elseif currentFile =~ ".*.py"
    call PythonTest(currentFile)
  else
    let errorMessage = "Can't run tests for this file.."
    lua require("notify")(errorMessage, "error")
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

function RspecTest(fileName)
  if exists('$TMUX')
    call system('tmux split -h "bundle exec rspec ' . a:fileName . ' --format documentation; read"')
  else
    exe "! bundle exec rspec " . a:fileName
  endif
endfunction

function PythonTest(fileName)
  let absoluteCommand = printf("pytest %s; read", expand("%"))

  if exists('$TMUX')
    let command = printf("tmux split -h '%s'", absoluteCommand)
    call system(command)
  else
    call system(printf("! %s", absoluteCommand))
  endif
endfunction

function RepoAbsolutePath()
  return system("git rev-parse --show-toplevel | tr -d '\\n'")
endfunction
