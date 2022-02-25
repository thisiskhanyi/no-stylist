function! Stylish()
    execute "normal! vi}d"
    execute "normal! kJ0f{"
    execute "normal! di}"

endfunction

command! Style call Stylish()
