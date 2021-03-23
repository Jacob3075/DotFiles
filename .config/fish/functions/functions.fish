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
