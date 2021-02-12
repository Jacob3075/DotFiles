" Key bindings for quickly moving between windows
  " h left, l right, k up, j down
    nmap <leader>h <c-w>h
    nmap <leader>l <c-w>l
    nmap <leader>k <c-w>k
    nmap <leader>j <c-w>j

  " Closing tabs
    nmap <leader>q :action CloseContent<cr>
    nmap <leader>Q :action ReopenClosedTab<cr>

  " To navigate between split panes
    nmap <leader>wn :action NextSplitter<cr>
    nmap <leader>wp :action PrevSplitter<cr>

  " Splits manipulation
    nmap <leader>wh :action SplitHorizontally<cr>
    nmap <leader>wv :action SplitVertically<cr>
    nmap <leader>wc :action Unsplit<cr>
    nmap <leader>wC :action UnsplitAll<cr>
    nmap <leader>wd :action OpenEditorInOppositeTabGroup<cr>
    " nmap <leader><leader> :action VimFilePrevious<cr>
    nmap <leader>ww :action JumpToLastWindow<cr>


