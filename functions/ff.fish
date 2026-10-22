function ff
  if test (count $argv) -gt 0
    set remote "$argv[1]"
  else
    set remote "origin"
  end

  if test (count $argv) -gt 1
    set branch "$argv[2]"
  else if git show-ref --verify --quiet refs/heads/main
    set branch "main"
  else if git show-ref --verify --quiet refs/heads/master
    set branch "master"
  else
    set branch "main"
  end

  echo "git pull $remote $branch --ff-only"
  git pull $remote $branch --ff-only
end