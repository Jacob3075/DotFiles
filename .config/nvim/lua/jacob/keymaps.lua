local map = vim.api.nvim_set_keymap
local options = { noremap = true }

vim.g.mapleader = ' '

map('n', '<Leader><Esc>', ':nohlsearch<CR>', options)
map('n', '<Leader>e', ':NERDTreeToggle<CR>', options)

-- Buffer Actions
map('n', '<Tab>', ':bnext<CR>', options)
map('n', '<S-Tab>', ':bprev<CR>', options)
map('n', '<Leader>bd', ':bdelete<CR>', options)
map('n', 'H', '^', options)
map('n', 'L', '$', options)

map('n', 'zj', 'o<Esc>k', options)
map('n', 'zk', 'O<Esc>j', options)

-- Window Navigation
map("n", "<C-h>", "<C-w>h", options)
map("n", "<C-j>", "<C-w>j", options)
map("n", "<C-k>", "<C-w>k", options)
map("n", "<C-l>", "<C-w>l", options)

-- Resize with arrows
map("n", "<C-Up>", ":resize +2<CR>", options)
map("n", "<C-Down>", ":resize -2<CR>", options)
map("n", "<C-Left>", ":vertical resize -2<CR>", options)
map("n", "<C-Right>", ":vertical resize +2<CR>", options)

-- keymap("n", "<leader>f", "<cmd>Telescope find_files<cr>", opts)
map("n", "<leader>f", "<cmd>lua require'telescope.builtin'.find_files()<cr>", options)
map("n", "<c-t>", "<cmd>Telescope live_grep<cr>", options)

map('i', 'jk', '<esc>', options)
map('i', 'kj', '<esc>', options)
map('i', 'jj', '<esc>', options)
map('i', '<C-h>', '<Left>', options)
map('i', '<C-j>', '<Down>', options)
map('i', '<C-k>', '<Up>', options)
map('i', '<C-l>', '<Right>', options)

map('v', 'H', '^', options)
map('v', 'L', '$', options)
--
-- Stay in indent mode
map("v", "<", "<gv", options)
map("v", ">", ">gv", options)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", options)
map("v", "<A-k>", ":m .-2<CR>==", options)
map("v", "p", '"_dP', options)

