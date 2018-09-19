function fish_prompt
  set_color yellow
  echo -n (parse_git_branch)
  set_color green
  echo -n (prompt_pwd)'> '
  set_color normal
end
