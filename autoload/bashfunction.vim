
" try to load bash_completions and show complete config from command
function! bashfunction#PreviewBashCompletion(command)
   call bashfunction#PreviewBashFileCompletion(a:command, a:command)
endfunction

" try to load bash_completions from file and show complete config from command
function! bashfunction#PreviewBashFileCompletion(file, command)
   "TODO: Use interactive shell (or actual shell to access dynamic loaded completions
   "TODO: deal with errors
   let completeConfig = system(". /usr/share/bash-completion/completions/" . a:command . "; complete -p " . a:file . " 2>&1")
    
   if v:shell_error != 0
      let completeConfig = system(". ~/.bashrc.d/" . a:file . "; complete -p " . a:command . " 2>&1")
   endif

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
function! bashfunction#PreviewBashFunction(functName, file)
   let functDef = system(". /usr/share/bash-completion/completions/" . a:file . "; declare -f " . a:functName . " 2>&1")
 
   "TODO: Config directories where completion files can be.
   if v:shell_error != 0
      let functDef = system(". ~/.bashrc.d/" . a:file . "; declare -f " . a:functName . " 2>&1")
   endif

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

" Open file function definition using extdebug option
function! bashfunction#OpenBashFunctionDefinition(functName, command)
   call bashfunction#OpenBashFileFunctionDefinition(a:functName, a:command, a:command)
endfunction

" Open file function definition using extdebug option
function! bashfunction#OpenBashFileFunctionDefinition(functName, file, command)
   let fileFuncDef = system(". /usr/share/bash-completion/completions/" . a:file . "; shopt -s extdebug; declare -F " . a:functName . " 2>&1; shopt -s extdebug")

   "TODO: Config directories where completion files can be.
   if v:shell_error != 0
      let fileFuncDef = system(". ~/.bashrc.d/" . a:file . "; shopt -s extdebug; declare -F " . a:functName . " 2>&1; shopt -s extdebug")
   endif

   let items = split(fileFuncDef," ")
   vsplit items[2] 
   endif
   normal! ggdG
   setlocal filetype=bashfunction
   setlocal buftype=nofile

   call append(0, split(functDef, '\v\n'))
endfunction

"Open file for vim function
"TODO: Move to vim functions
function! bashfunction#LocateVimFunctionDefinition(funcName)
   let temp = tempname()
   let verbosefile = &verbosefile
   echom temp
   call writefile(['verbose '.a:funcName], temp, 'b')
   try
      let &verbosefile = temp
      exe ':silent verbose function ' . a:funcName
   finally
      let &verbosefile = verbosefile
   endtry
   return split(readfile(temp)[2], " ")[-1]
endfunction

"TODO: after locate vim function search for it on file and go to that line

