command! -nargs=* PreviewBashCompletion :call bashfunction#PreviewBashCompletion(<f-args>)
command! -nargs=* PreviewBashFileCompletion :call bashfunction#PreviewBashFileCompletion(<f-args>)
command! -nargs=* PreviewBashFunction :call bashfunction#PreviewBashFunction(<f-args>)

" you need to provide filename to locate function
map <Leader>sc :PreviewBashCompletion| "stands for Show Completion 
map <Leader>scf :PreviewBashFileCompletion| "stands from Show Completion from File 
map <Leader>scff :PreviewBashFunction <C-R>=expand('<cword>')<CR>| "stands from Show Completion from File of Function 
 
