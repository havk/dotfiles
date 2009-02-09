" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
	finish
endif

func! PerlFunctionHeader()
	let fn_name = get(matchlist(getline('.'), '^sub \(\w\+\)'), 1, '')
	if fn_name != ''
		let comment = ['# '.fn_name.' --', '#   ' ]
		call append(line('.')-1, comment)
		normal kA
	else
		echo 'Not on a function line'
	endif
endfunc

nnoremap <Leader>h :call PerlFunctionHeader()<CR>
vnoremap <Leader>c :'<,'>normal gI#<ESC>

let b:did_ftplugin = 1
