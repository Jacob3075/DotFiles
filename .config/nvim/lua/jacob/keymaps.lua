local map = vim.api.nvim_set_keymap
options = { noremap = true }

map('n', '<leader><esc>', ':nohlsearch<CR>', options)
map('n', '<leader>e', ':Explore<CR>', options)
map('n', '<Tab>', ':bnext<CR>', options)
map('n', '<S-Tab>', ':bprev<CR>', options)
map('n', '<leader><Esc>', ':nohlsearch<CR>', options)
map('n', 'H', '^', options)
map('n', 'L', '$', options)
map('n', 'zj', 'o<Esc>k', options)
map('n', 'zk', 'O<Esc>j', options)

map('i', 'jk', '<esc>', options)
map('i', 'kj', '<esc>', options)
map('i', 'jj', '<esc>', options)
map('i', '<C-h>', '<Left>', options)
map('i', '<C-j>', '<Down>', options)
map('i', '<C-k>', '<Up>', options)
map('i', '<C-l>', '<Right>', options)

map('v', 'H', '^', options)
map('v', 'L', '$', options)
