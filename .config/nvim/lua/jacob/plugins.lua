vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  use { 'andymass/vim-matchup' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use { "morhetz/gruvbox" }

  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup { mappings_style = "surround" }
    end
  }

  use { 
    'norcalli/nvim-colorizer.lua',
    config = function ()
      require 'colorizer'.setup {
        '*';
	'vim';
      }
    end
  }

  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

  use { 
    'nvim-lualine/lualine.nvim', 
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = function()
      local custom_gruvbox = require'lualine.themes.gruvbox'
      -- Change the background of lualine_c section for normal mode
      custom_gruvbox.normal.c.bg = '#112233' -- rgb colors are supported
      require 'lualine' .setup {
        options = { theme  = custom_gruvbox },
      }
    end
  }

  use { 'preservim/nerdtree' }

  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
	
      }
    end
  }

  use {
    "p00f/nvim-ts-rainbow",
    config = function()
      require("nvim-treesitter.configs").setup {
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
       }
     }
    end
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }
end)

