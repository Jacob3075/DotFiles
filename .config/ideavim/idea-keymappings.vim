" Remmaped Search
  nnoremap / :action Find<CR>
  nnoremap <Leader>/ /

" Navigation
  nmap <leader>h :action Back<cr>
  nmap <leader>l :action Forward<cr>
  nmap <leader>L :action RecentLocations<cr>
  nmap <leader>d :action GotoDeclaration<cr>
  nmap <leader>u :action FindUsages<cr>
  nmap <leader>f :action GotoFile<cr>
  nmap <leader>c :action GotoClass<cr>
  nmap <leader>s :action GotoSymbol<cr>
  
  nmap <leader>; :action FileStructurePopup<cr>
  nmap <leader>M :action ActivateStructureToolWindow<cr>
  nmap <leader>i :action GotoImplementation<cr>
  nmap <leader>I :action SelectIn<cr>
  nmap <leader>e :action RecentFiles<cr>
  nmap <leader>t :action GotoTest<cr>
  nmap <leader>p :action JumpToLastWindow<cr>
  nmap <leader>b :action ShowBookmarks<cr>


  nmap <leader>gi :action GotoImplementation<cr>
  nmap <leader>gt : action GotoTest<cr>


" nmap <leader>a :action Switcher<cr>
  nmap <leader>a :action RecentChangedFiles<cr>

" Refactorings
  vmap <leader>R :action Refactorings.QuickListPopupAction<cr>
  nmap <leader>rr :action RenameElement<cr>
  nmap <leader>rg :action Generate<cr>
  nmap <leader>rI :action OptimizeImports<cr>

" Inspection
  nmap <leader>ic :action InspectCode<cr>

" VCS operations
  nmap <leader>vc :action Vcs.Show.Local.Changes<cr>                          
  nmap <leader>vp :action Vcs.QuickListPopupAction<cr>
  nmap <leader>va :action Annotate<cr>
  nmap <leader>vl :action Vcs.Show.Log<cr>
  nmap <leader>vd :action Compare.LastVersion<cr>
  " nmap <leader>yr :action Git.ResolveConflicts<cr>                          

" Terminal
  nmap <leader>T :action ActivateTerminalToolWindow<cr>                          

" External GVim
  nmap <leader>v :action Tool_External Tools_gvim<cr>

" IdeaVim uses 'a' for alt instead of Vim's 'm'
  nmap <a-j> 15gj
  nmap <a-k> 15gk

" Won't work in visual mode (with vmap) for some reason.
" Use default map of <c-/> for that.
  nmap <leader>cl :action CommentByLineComment<cr>
  nmap C-/ :action CommentByLineComment<cr>

" unimpaired mappings - from https://github.com/saaguero/ideavimrc/blob/master/.ideavimrc
  nnoremap [<space> O<esc>j
  nnoremap ]<space> o<esc>k

  nnoremap [q :action PreviousOccurence<cr>
  nnoremap ]q :action NextOccurence<cr>
  nnoremap no :action NextOccurence<cr>
  nnoremap po :action PreviousOccurence<cr>

  nnoremap [m :action MethodUp<cr>
  nnoremap ]m :action MethodDown<cr>
  nnoremap nm :action MethodDown<cr>
  nnoremap pm :action MethodUp<cr>

  nnoremap [c :action VcsShowPrevChangeMarker<cr>
  nnoremap ]c :action VcsShowNextChangeMarker<cr>
  nnoremap nc :action VcsShowNextChangeMarker<cr>
  nnoremap pc :action VcsShowPrevChangeMarker<cr>


" Tabs
  nnoremap [b :action PreviousTab<cr>
  nnoremap ]b :action NextTab<cr>

" Search
  nmap <leader>\ :action FindInPath<cr>

" Moving lines
  nmap ]e :action MoveLineDown<cr>
  nmap [e :action MoveLineUp<cr>

" Moving statements
  nmap [s :action MoveStatementUp<cr>
  nmap ]s :action MoveStatementDown<cr>

" Building, Running and Debugging
  nmap ,c :action CompileDirty<cr>
  nmap ,r :action Run<cr>
  nmap ,R :action RunAnything<cr>
  nmap ,d :action Debug<cr>
  nmap ,c :action RunClass<cr>
  nmap ,dc :action DebugClass<cr>
  nmap ,t :action RerunTests<cr>                                         
  nmap ,T :action RerunFailedTests<cr>
 
" Errors
  nmap <leader>ne :action GotoNextError<cr>
  nmap <leader>pe :action GotoPreviousError<cr>
  nmap <leader>en :action GotoNextError<cr>
  nmap <leader>ep :action GotoPreviousError<cr>
  nmap <leader>ed :action ShowErrorDescription<cr>

