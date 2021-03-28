function n
    command gnvim $argv & disown
end

function nd
    begin
        set -lx GIT_DIR $DOTBARE_DIR
        set -lx GIT_WORK_TREE $DOTBARE_TREE
        command gnvim $argv & disown
    end
end

function open 
    command xdg-open $argv & disown
end

# Make su launch fish
function su
   command su --shell=/usr/bin/fish $argv
end

function autojump-list-dirs
  autojump -s | head -n -7 | sort -n | tac | awk  '{$1=""; print $0}' | awk '{$1=$1};1'
end
