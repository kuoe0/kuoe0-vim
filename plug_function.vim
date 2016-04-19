" build YCM when updated
function! BuildYCM(info)
	echo 'status:' . a:info.status
	if a:info.status == 'updated' || a:info.status == 'installed'
		!./install.sh --clang-completer
	endif
endfunction
