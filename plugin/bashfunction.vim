command! ShowBashCompletion :call bashfunction#ShowBashCompletion("git")
command! -nargs=1 ShowBashFunction :call bashfunction#ShowBashFunction("git", <f-args>)

map <Leader>sc :ShowBashCompletion <CR>
map <Leader>scf :ShowBashFunction <C-R>=expand('<cword>')<CR><CR>
