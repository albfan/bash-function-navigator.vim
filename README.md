## bash-function.vim

A helper to navigate through bash defined functions inside vim

### Intro

bash completion is a powerful feature, loaded on startup from simple bash script and some listener to readline glued by complete builtin.

In theory you can browse commands with `declare -f <name>`, but in practice is nearly impossible to find problems or improvements with that approach.

This vim script tryes to help to show logic related to functionality managed by bash functions.

### State of the art

By now, there is only a few functions about load completion command and follow function declaration. For simplicity it work for "git" completion, a large and powerful autocompletion. 

### Issues

- Completions are loaded through `/usr/share/bash-completion/bash-completion` and friend scripts. Nowadays bash-completion becomes smarter to load only completions when it's needed. so `/usr/share/bash-completion/completions/<command>` must be loaded in some cases.
- Using same buffer for show complete and functions ends with no history navigation.
- Allow reload from script to test new functionality
