function parse_git_branch
  git branch ^ /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\[$dev_git_branch \1\] /"
end
