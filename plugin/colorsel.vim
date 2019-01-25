function! s:colorss()
  let l:colorschemes = sort(map(globpath(&rtp, 'colors/*.vim', 1, 1), 'fnamemodify(v:val, ":t:r")'))
  exe printf('silent %dvnew', max(map(copy(l:colorschemes), 'strdisplaywidth(v:val)')))
  silent file _COLOR_SCHEME_SELECTOR_
  call setline(1, l:colorschemes)
  setlocal buftype=nofile bufhidden=wipe nonumber nomodifiable cursorline
  call search(g:colors_name)
  augroup ColorSchemeSelector
    au!
    au CursorMoved <buffer> :exe 'colorscheme' getline('.')
  augroup END
  nnoremap <buffer> q <c-w>c
endfunction

command! ColorSchemeSelector call s:colorss()
