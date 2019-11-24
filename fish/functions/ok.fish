function ok
  set _p (history | head -n 1)

  if test (count $argv) -gt 0
    if [ $argv[1] = "last" ]
      set _l -1
    else
      set _l $argv[1]
    end
  else
    set _l 1
  end
    
  switch $_p
  case "find*"
    set _line (eval (history | head -n 1))
    vim $_line[$_l]
  case "gg*" "git grep*"
    set _line (eval (history | head -n 1))
    vim (echo $_line[$_l] | sed "s/\([^:]*\):.*/\1/")
  end
end
