function! Stylish()
    execute "normal! vi}d"
    execute "normal! kJ0f{"
    execute "normal! di}"
    let compName = expand('%:r')
    execute "normal! i" .compName. "Style"
    execute "normal! bvUw"
    execute "normal! i.\<ESC>"
    let node = GetNodeName()
    execute "normal! li" .node. ""

endfunction

function! GetNodeName()
    let chars = ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',]

    let nodeStr = ""
    for i in range(1, 6)
        let index = GetRandomInteger() % len(chars)
        let nodeStr = nodeStr . chars[index]
    endfor
    return nodeStr

endfunction

function! GetRandomInteger()
    if has('win32')
        return system("echo %RANDOM%")
    else
        return system("echo $RANDOM")
    endif
endfunction

command! Style call Stylish()
