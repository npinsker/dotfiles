function fish_prompt
  if not type -q 'docker'
    set_color cyan
    echo -n $file_docker ' '
  end
  if test (parse_git_branch)
    set_color f66
    echo -n '['
    echo -n $dev_git_branch
    set_color 9ff
    echo -n (parse_git_branch)
    set_color f66
    echo -n '] '
  end
  set_color green
  echo -n (prompt_pwd)' '
  set_color yellow
  echo -n '✗ '
  set_color normal
end
