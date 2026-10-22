function __work_project_from_cmdline
    commandline -opc | sed -n 2p
end

complete -c work -f -n '__fish_is_nth_token 1' -a '(ls ~/5A)' -d project
complete -c work -f -n '__fish_is_nth_token 2' -a '(git -C ~/5A/(__work_project_from_cmdline) branch --format="%(refname:short)" 2>/dev/null)' -d branch
