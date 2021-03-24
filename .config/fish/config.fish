# Term
switch "$TERM_EMULATOR"
case '*kitty*'
        export TERM='xterm-kitty'
case '*'
        export TERM='xterm-256color'
end

source ~/.config/fish/globals.fish
source ~/.config/fish/abbreviations.fish
source ~/.config/fish/omf.fish

# SDKMAN
set PATH $PATH (find ~/.local/share/sdkman/candidates/*/current/bin -maxdepth 0) # omf install sdk

# SOURCE ALIAS AND EXPORTS
source ~/.config/aliasrc
source ~/.config/exports
source ~/.config/fish/functions/functions.fish

starship init fish | source

