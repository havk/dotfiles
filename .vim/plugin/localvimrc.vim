" Name:    localvimrc.vim
" Version: $Id: localvimrc.vim 1870 2007-09-28 09:17:23Z mbr $
" Author:  Markus Braun
" Summary: Search local vimrc files and load them.
" Licence: This program is free software; you can redistribute it and/or
"          modify it under the terms of the GNU General Public License.
"          See http://www.gnu.org/copyleft/gpl.txt
" Section: Documentation {{{1
" Description:
"
"   This plugin searches for local vimrc files in the filesystem tree of the
"   currently opened file. By default it searches for all ".lvimrc" files from
"   the file's directory up to the root directory and loads them in reverse
"   order. The filename and amount of loaded files is customizable through
"   global variables.
"
" Installation: 
"
"   Copy the gnupg.vim file to the $HOME/.vim/plugin directory.
"   Refer to ':help add-plugin', ':help add-global-plugin' and ':help
"   runtimepath' for more details about Vim plugins.
"
" Variables:
"
"   g:localvimrc_name
"     Filename of local vimrc files. Defaults to ".lvimrc".
"
"   g:localvimrc_count
"     On the way from root, the last localvimrc_count files are sourced.
"     Defaults to -1 (all)
"
" Section: Plugin header {{{1
" guard against multiple loads {{{2
if (exists("g:loaded_localvimrc") || &cp)
  finish
endif
let g:loaded_localvimrc = "$Revision: 1870 $"

" check for correct vim version {{{2
if version < 700
  finish
endif

" define default local vimrc file name {{{2
if (!exists("g:localvimrc_name"))
  let g:localvimrc_name = ".lvimrc"
endif

" define default "search depth" {{{2
if (!exists("g:localvimrc_count"))
  let g:localvimrc_count = -1
endif

" Section: Functions {{{1
" Function: s:localvimrc {{{2
"
" search all local vimrc files from current directory up to root directory and
" source them in reverse order.
"
function! s:localvimrc() 
  " directory of current file (correctly escaped)
  let l:directory = escape(expand("%:p:h"), ' ~|!"$%&()=?{[]}+*#'."'")

  " generate a list of all local vimrc files along path to root
  let l:rcfiles = findfile(g:localvimrc_name, l:directory . ";", -1)

  " shrink list of found files
  if g:localvimrc_count == -1
    let l:rcfiles = l:rcfiles[0:-1]
  elseif g:localvimrc_count == 0
    let l:rcfiles = []
  else
    let l:rcfiles = l:rcfiles[0:(g:localvimrc_count-1)]
  endif

  " source all found local vimrc files along path from root (reverse order)
  for l:rcfile in reverse(l:rcfiles)
    if filereadable(l:rcfile)
      exec 'source ' . escape(l:rcfile, ' ~|!"$%&()=?{[]}+*#'."'")
      "echom 'sourced ' . l:rcfile
    endif
  endfor
endfunction

" Section: Autocmd setup {{{1
if has("autocmd")
  augroup localvimrc                                                                                                                                                                                                 
    autocmd!
    " call s:localvimrc() when creating ore reading any file
    autocmd BufNewFile,BufRead * call s:localvimrc()
  augroup END
endif

" vim600: foldmethod=marker
