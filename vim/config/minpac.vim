
packadd minpac

call minpac#init()

function! MinpacUpdatePluginsAndDocs()
    call minpac#update()
    call minpac#clean()
    silent! helptags ALL
endfunction

command! MinpacUpdate call MinpacUpdatePluginsAndDocs()

call minpac#add("k-takata/minpac", {"type": "opt"})
