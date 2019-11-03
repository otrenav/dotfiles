
function! OwnPreserve(command)
    let search=@/
    let cursor_position=getpos('.')
    normal! H
    let window_position=getpos('.')
    call setpos('.', cursor_position)
    execute a:command
    let @/=search
    call setpos('.', window_position)
    normal! zt
    call setpos('.', cursor_position)
endfunction
