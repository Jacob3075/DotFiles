vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use { 'wbthomason/packer.nvim' }

  use { 'andymass/vim-matchup' }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  use { 'glepnir/galaxyline.nvim', requires = { 'kyazdani42/nvim-web-devicons' } }

  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }

  use { "morhetz/gruvbox" }
  use {
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup { mappings_style = "surround" }
    end
}
end)
