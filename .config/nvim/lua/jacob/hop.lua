local hop = require('hop')
local directions = require('hop.hint').HintDirection

hop.setup {
  jump_on_sole_occurrence = true,
  quit_key = '<EPC>',
  case_insensitive = true,
}

vim.keymap.set('n', 'f', hop.hint_patterns, {remap=true})

vim.keymap.set('n', '<leader>al', hop.hint_lines_skip_whitespace, {remap=true})
vim.keymap.set('n', '<leader>af', function()
    hop.hint_char2({current_line_only=true})
end, {remap=true})

