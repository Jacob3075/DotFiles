
nnoremap <A-g> :GFiles<CR>
nnoremap <A-z> :Files<CR>
let g:fzf_preview_window = 'right:60%'

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
