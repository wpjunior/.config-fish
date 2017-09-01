function ff
  if test (count $argv) -gt 0
    set remote "$argv[1]"
  else
    set remote "origin"
  end

  if test (count $argv) -gt 1
    set branch "$argv[2]"
  else
    set branch "master"
  end

  echo "git pull $remote $branch --ff-only"
  git pull $remote $branch --ff-only
end