source $HOME/.config/nvim/keymappings.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/plugins.vim
" Plugins


	" easy commenting motions
	"     Plug 'tpope/vim-commentary'
	
	" mappings to easily delete, change and add such surroundings in pairs, such as quotes, parens, etc.
	"     Plug 'tpope/vim-surround'
	
	" detect indent style (tabs vs. spaces)
	"     Plug 'tpope/vim-sleuth'
	
	" Startify: Fancy startup screen for vim {{{
	"     Plug 'mhinz/vim-startify'
	
	" context-aware pasting
	"     Plug 'sickill/vim-pasta'

	"     Plug 'ryanoasis/vim-devicons'

	" FZF
		" Plug '/usr/local/opt/fzf'
		" Plug 'junegunn/fzf.vim'
		" let g:fzf_layout = { 'down': '~25%' }

		" if isdirectory(".git")
			" if in a git project, use :GFiles
			" nmap <silent> <leader>p :GitFiles --cached --others --exclude-standard<cr>
		" else
			" otherwise, use :FZF
			" nmap <silent> <leader>p :FZF<cr>
		" endif

		" nmap <silent> <leader>n :GFiles?<cr>

		" nmap <silent> <leader>r :Buffers<cr>
		" nmap <silent> <leader>e :FZF<cr>
		" nmap <leader><tab> <plug>(fzf-maps-n)
		" xmap <leader><tab> <plug>(fzf-maps-x)
		" omap <leader><tab> <plug>(fzf-maps-o)


