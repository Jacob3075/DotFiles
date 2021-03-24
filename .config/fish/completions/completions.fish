set -l dotbare_commands fadd

complete -f -c dotbare -n "not __fish_seen_subcommand_from $dotbare_commands" -a $dotbare_commands

complete -c dotbare -w git

