# From https://github.com/fish-shell/fish-shell/wiki/Bash-Style-Command-Substitution-and-Chaining-(!!-!%24-&&-||)

function bind_bang
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function fish_user_key_bindings
  bind ! bind_bang
end
