function parse_git_branch
  git branch ^ /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/ \1/"
end
