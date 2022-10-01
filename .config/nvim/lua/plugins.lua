local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
    vim.cmd [[packadd packer.nvim]]
end

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'RRethy/nvim-base16'

    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }
    use 'nvim-telescope/telescope-project.nvim'
    use {
        "AckslD/nvim-neoclip.lua",
        requires = {
            { 'nvim-telescope/telescope.nvim' },
        },
        config = function()
            require('neoclip').setup()
        end
    }
    use "nvim-telescope/telescope-file-browser.nvim"

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-nvim-lsp'

    use 'L3MON4D3/LuaSnip' -- TODO?
    use 'saadparwaiz1/cmp_luasnip'

    use 'numToStr/Comment.nvim' -- TODO: block comments

    use 'onsails/lspkind.nvim'


    -- TODO: 
    -- lualine
    -- tabs
    -- git stuff
    -- motion
    -- dashboard
    -- whichkey

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require 'plugins.treesitter'
require 'plugins.nvim_tree'
require 'plugins.telescope'
require 'plugins.neoclip'
require 'plugins.lua_snip'
require 'plugins.nvim_cmp'
require 'plugins.comment'
