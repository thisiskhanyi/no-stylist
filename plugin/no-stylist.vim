function! Stylish()
    execute 'normal! vi}"kyd'
    execute "normal! kJ0f{"
    execute "normal! di}"

    let compName = expand('%:r')
    execute "normal! i" .compName. "Style"
    execute "normal! bvUw"
    execute "normal! i.\<ESC>"

    let node = GetNodeName()
    execute "normal! li" .node. ""
    execute 'normal! vi}"ny'

    :e styles/StylesPlug.js
    execute "normal! gg}oexport const \<ESC>"
    execute 'normal! "npbhv$d'
    execute "normal! a\<SPACE>=\<SPACE>{\<CR>}\<ESC>ko" 
    execute "normal! pbdh\<ESC>$a:\<SPACE>{\<ESC>"
    execute "normal! o}\<ESC>ko"
    execute 'normal! "kp'
    execute "normal! (V)="

    :w
    :e#
    execute "normal! gg}iimport {"
    execute 'normal! "np'
    execute 'normal! bdhdwa} from "../styles/StylesPlug"'
    execute "normal! o"

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
