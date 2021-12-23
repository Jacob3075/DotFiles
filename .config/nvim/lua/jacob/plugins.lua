local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  use "andymass/vim-matchup" 

  use "morhetz/gruvbox"
  use "LunarVim/Colorschemes"

  use "norcalli/nvim-colorizer.lua"

  use "preservim/nerdtree"

  -- TODO
  use "ahmedkhalf/project.nvim"

  use "folke/which-key.nvim"

  use "blackCauldron7/surround.nvim"

  -- TODO
  use "p00f/nvim-ts-rainbow"
 
  use {
    "nvim-treesitter/nvim-treesitter", 
    run = ":TSUpdate" 
  }

  use { 
    "lewis6991/gitsigns.nvim", 
    requires = "nvim-lua/plenary.nvim"  
  }

  use {
    "akinsho/bufferline.nvim",
    requires = "kyazdani42/nvim-web-devicons"
  }

  use { 
    "nvim-lualine/lualine.nvim", 
    requires = "kyazdani42/nvim-web-devicons" 
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
