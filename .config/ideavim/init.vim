source ./general-settings.vim

" Enable Plugins
set surround
set multiple-cursors
set commentary
set argtextobj
set easymotion
set textobj-entire
set ReplaceWithRegister

" Plugin Settings
let g:argtextobj_pairs="[:],(:),<:>"

" Idea Settings
set ideajoin
set idearefactormode=keep

source ./general-keymappings.vim
source ./window-keymappings.vim
