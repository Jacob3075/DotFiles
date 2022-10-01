local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

g.t_co = 256
g.background = "dark"

-- Update the packpath
local packer_path = vim.fn.stdpath('config') .. '/site'
o.packpath = vim.o.packpath .. ',' .. packer_path

g.mapleader = " "

opt.mouse = "a"
opt.guicursor = ""
o.clipboard = 'unnamedplus'
opt.termguicolors = true

opt.number = true
opt.errorbells = false

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
o.ignorecase = true
o.smartcase = true

opt.scrolloff = 8
-- vim.opt.signcolumn = "yes"
-- vim.opt.isfname:append("@-@")

-- Give more space for displaying messages.
opt.cmdheight = 1

-- Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
-- delays and poor user experience.
opt.updatetime = 50

-- Don't pass messages to |ins-completion-menu|.
opt.shortmess:append("c")

local colorschemes = {"base16-tokyodark", "base16-tokyodark-terminal", "base16-tokyo-city-dark"}
vim.cmd('colorscheme ' .. colorschemes[math.random(#colorschemes)]) 
