function work --description "Create/attach a worktree for <project> on <branch> and cd into it"
  if test (count $argv) -ne 2
    echo "usage: work <project> <branch>" >&2
    return 1
  end

  set project "$argv[1]"
  set branch "$argv[2]"

  set worktree_dir ~/6A/$project/$branch

  if test -d $worktree_dir
    cd $worktree_dir
    return
  end

  cd ~/5A/$project
  or return 1

  git worktree add -B $branch $worktree_dir
  or return 1

  cd $worktree_dir
end
