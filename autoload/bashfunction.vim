
" try to load bash_completions and show complete config from command
function! bashfunction#ShowBashCompletion(command)
   "TODO: Use interactive shell (or actual shell to access dynamic loaded completions
   "TODO: deal with errors
   let completeConfig = system(". /usr/share/bash-completion/completions/" . a:command . "; complete -p " . a:command . " 2>&1")
    
   if bufexists("__Complete_Config__")
      buffer __Complete_Config__
   else
      vsplit __Complete_Config__
   endif
   normal! ggdG
   setlocal filetype=bashfunction
   setlocal buftype=nofile

   call append(0, split(completeConfig, '\v\n'))
endfunction

" show defined function functName from bash completion for command
function! bashfunction#ShowBashFunction(command, functName)
   let functDef = system(". /usr/share/bash-completion/completions/" . a:command . "; declare -f " . a:functName . " 2>&1")

   if bufexists("__Bash_Function__")
      buffer __Bash_Function__
   else
      vsplit __Bash_Function__
   endif
   normal! ggdG
   setlocal filetype=bashfunction
   setlocal buftype=nofile

   call append(0, split(functDef, '\v\n'))
endfunction
