local lsp_buf = vim.lsp.buf
local telescope_exts = require 'telescope.extensions'
local builtins = require 'telescope.builtin'

local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true, noremap = true })
end

map('i', 'jk', '<ESC>')
map('i', 'jj', '<ESC>')
map('i', 'kk', '<ESC>')

map('v', 'v', '<ESC>')

map('n', 'zj', 'o<ESC>k')
map('n', 'zk', 'O<ESC>j')

map('n', '<leader>h', '<c-w>h')
map('n', '<leader>l', '<c-w>l')
map('n', '<leader>k', '<c-w>k')
map('n', '<leader>j', '<c-w>j')

map('n', 'H', '^')
map('n', 'L', '$')
map('v', 'H', '^')
map('v', 'L', '$')

map('i', '<C-h>', '<Left>')
map('i', '<C-j>', '<Down>')
map('i', '<C-k>', '<Up>')
map('i', '<C-l>', '<Right>')

map('n', '<Tab>', ':bnext<CR>')
map('n', '<S-Tab>', ':bprev<CR>')

-- TODO: Jump list, tag list

map('n', 'gD', lsp_buf.declaration)
map('n', 'gd', lsp_buf.definition)
map('n', 'gu', lsp_buf.references)
map('n', 'K', lsp_buf.hover)
map('n', 'gi', lsp_buf.implementation)
map('n', '<C-k>', lsp_buf.signature_help)
map('n', 'gT', lsp_buf.type_definition)
map('n', '<leader>rr', lsp_buf.rename)
map('n', '<Enter><Enter>', lsp_buf.code_action)
map('n', '<leader>=', lsp_buf.formatting)
-- map('n', '<space>wa', lsp_buf.add_workspace_folder)
-- map('n', '<space>wr', lsp_buf.remove_workspace_folder)
-- map('n', '<space>wl', function()
-- print(vim.inspect(lsp_buf.list_workspace_folders()))
-- end)

-- Nvim Tree
map('n', '<A-1>', ':NvimTreeToggle<CR>')
map('n', '<A-!>', ':NvimTreeFindFileToggle<CR>')

-- Telescope
map('n', '<leader>ff', builtins.find_files)
map('n', '<leader><leader>', builtins.find_files)
map('n', '<leader>fb', builtins.buffers)
map('n', '<leader>fg', builtins.live_grep)
map('n', '<leader>fmk', builtins.marks)
map('n', '<leader>fmp', builtins.man_pages)
map('n', '<leader>fq', builtins.quickfix)

map('n', '<leader>fp',  telescope_exts.project.project )
map('n', '<leader>fy',  telescope_exts.neoclip.default )
map('n', '<leader>fe',  telescope_exts.file_browser.file_browser)
