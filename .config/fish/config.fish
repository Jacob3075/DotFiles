# Fish colors
set -g fish_color_command --bold green
set -g fish_color_error red
set -g fish_color_quote yellow
set -g fish_color_param white
set -g fish_pager_color_selected_completion blue

# Some config
set -g fish_greeting

# Git config
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showupstream informative
set -g __fish_git_prompt_showdirtystate yes
set -g __fish_git_prompt_char_stateseparator ' '
set -g __fish_git_prompt_char_cleanstate '✔'
set -g __fish_git_prompt_char_dirtystate '✚'
set -g __fish_git_prompt_char_invalidstate '✖'
set -g __fish_git_prompt_char_stagedstate '●'
set -g __fish_git_prompt_char_stashstate '⚑'
set -g __fish_git_prompt_char_untrackedfiles '?'
set -g __fish_git_prompt_char_upstream_ahead ''
set -g __fish_git_prompt_char_upstream_behind ''
set -g __fish_git_prompt_char_upstream_diverged 'ﱟ'
set -g __fish_git_prompt_char_upstream_equal ''
set -g __fish_git_prompt_char_upstream_prefix ''''

# Get terminal emulator
set TERM_EMULATOR (ps -aux | grep (ps -p $fish_pid -o ppid=) | awk 'NR==1{print $11}')

# Directory abbreviations
abbr -a -g d 'dirs'
abbr -a -g h 'cd $HOME'

# Locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Term
switch "$TERM_EMULATOR"
case '*kitty*'
        export TERM='xterm-kitty'
case '*'
        export TERM='xterm-256color'
end

# User abbreviations
abbr -a -g sayonara 'shutdown now'# Epic way to shutdown
abbr -a -g shinei 'kill -9'# Kill ala DIO
abbr -a -g priv 'fish --private'# Fish incognito mode
abbr -a -g untar 'tar -zxvf'# Untar
abbr -a -g ips 'ip link show'# Get network interfaces information

# Source plugins
# Useful plugins: archlinux bang-bang cd colorman sudope vcs
if test -d "$HOME/.local/share/omf/pkg/colorman/"
        source ~/.local/share/omf/pkg/colorman/init.fish
end

# SOURCE ALIAS AND EXPORTS
source ~/.config/aliasrc
source ~/.config/exports
source ~/.config/fish/functions.fish


# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

starship init fish | source

