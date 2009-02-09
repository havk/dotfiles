" Havk
" Nov 29th, 2008
" ----------------------------------------
" Vim syntax file for TODO list
" ----------------------------------------
"
syntax region TodoNotdone start="^\s*\zs\[ \]" end="^\ze\s*\[.\]"
syntax region TodoDone    start="^\s*\zs\[X\]" end="^\ze\s*\[.\]"

highlight link TodoNotdone Statement
highlight link TodoDone    Comment

