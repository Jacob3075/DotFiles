" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    Plug 'neovim/nvim-lsp' " nvim-lsp

    Plug 'jackguo380/vim-lsp-cxx-highlight'
    
    " Commenting
    Plug 'tpope/vim-commentary'

    " Tags
    Plug 'alvan/vim-closetag'
    Plug 'tpope/vim-surround'
    Plug 'mattn/emmet-vim'

    " context-aware pasting
    Plug 'sickill/vim-pasta'

    Plug 'ryanoasis/vim-devicons'
    
    " FZF
    " Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    " Plug 'junegunn/fzf.vim'
    
    " Telescope
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Misc
    Plug 'tpope/vim-repeat'
    Plug 'lambdalisue/fern.vim'
    Plug 'lambdalisue/nerdfont.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim'
    Plug 'wellle/targets.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'kyazdani42/nvim-web-devicons'


    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'
    Plug 'mhinz/vim-signify'
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " Themes
    Plug 'morhetz/gruvbox'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    " Plug 'numtostr/gruvbox-material'


    " detect indent style (tabs vs. spaces)
    "     Plug 'tpope/vim-sleuth'

    " Startify: Fancy startup screen for vim {{{
    "     Plug 'mhinz/vim-startify'
      

call plug#end()

source $HOME/.config/nvim/settings/fzf.vim
source $HOME/.config/nvim/settings/gitgutter.vim
source $HOME/.config/nvim/settings/telescope.vim
