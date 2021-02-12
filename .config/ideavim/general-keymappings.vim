" Insert mode shortcut
  inoremap <C-h> <Left>
  inoremap <C-j> <Down>
  inoremap <C-k> <Up>
  inoremap <C-l> <Right>
  inoremap <C-a> <Home>
  inoremap <C-e> <End>
  inoremap <C-d> <Delete>

" Quit insert mode
  inoremap jj <Esc>
  inoremap jk <Esc>
  inoremap kk <Esc>

" Quit visual mode
  vnoremap v <Esc>
  nnoremap <Leader>sc :nohlsearch<CR>

  " Move to the start and end of the line
  nnoremap H ^
  nnoremap L $

" Use Q for formatting the current paragraph (or visual selection)
  vmap Q gq
  nmap Q gqap

" These create newlines like o and O but stay in normal mode
  nmap zj o<Esc>k
  nmap zk O<Esc>j

