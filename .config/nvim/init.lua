vim.o.swapfile = true
vim.o.dir = '/tmp'
vim.o.smartcase = true
vim.o.laststatus = 2
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.scrolloff = 8
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.smarttab = true
vim.o.smartindent = true
vim.o.incsearch = true
vim.o.showcmd = true
vim.o.showmode = true
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,preview,noselect,noinsert"
vim.o.mouse = "a"
vim.o.termguicolors = true

vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.numberwidth = 4

vim.bo.shiftwidth = 4

vim.cmd("set matchpairs+=<:>")

--vim.o.background = "dark"

vim.g.mapleader = ' '

vim.cmd [[source ./auto_commands.vim]]
vim.cmd [[colorscheme gruvbox]]
require"jacob.keymaps"
require"jacob.plugins"

