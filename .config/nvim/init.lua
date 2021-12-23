-- Auto Commands
vim.cmd [[
    autocmd! BufWritePost $MYVIMRC nested source $MYVIMRC

    function! MyHighlights() abort
"	highlight Normal     cterm=NONE ctermbg=17              gui=NONE guibg=#000000
    endfunction

    augroup MyColors
	autocmd!
	autocmd ColorScheme * call MyHighlights()
    augroup END
]]


require"jacob.options"
require"jacob.plugins"
require"jacob.keymaps"

vim.cmd [[colorscheme gruvbox]]

