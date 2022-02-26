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
    execute 'normal! vw"zy'

    :e styles/StylesPlug.js

    let reg = getreg("z") 
    let [s:line, s:col] = searchpos(reg)
    if (s:line == 0)
        execute "normal! gg}oexport const \<ESC>"
        execute 'normal! "npbhv$d'
        execute "normal! a\<SPACE>=\<SPACE>{\<CR>}\<ESC>ko" 
        execute "normal! pbdh\<ESC>$a:\<SPACE>{\<ESC>"
    endif
    if (s:line > 0) 
        execute "normal! /".reg."\<CR>"
        execute "normal! o\<ESC>"
        execute 'normal! "np'
        execute "normal! 0vf.dv$dko"
        execute "normal! pA:\<SPACE>{\<ESC>"
    endif

    execute "normal! o},\<ESC>ko"
    execute 'normal! "kp'
    execute "normal! (V)="

    :w
    :e#

    let [s:lin, s:col] = searchpos("../styles/StylesPlug")
    if (s:lin == 0)
        execute "normal! gg}iimport {"
        execute 'normal! "np'
        execute 'normal! bdhdwa} from "../styles/StylesPlug"'
        execute "normal! o\<ESC>"
    endif


endfunction

function! DoesExist() 
    let regii = getreg("b") 
    let regs = regii[0:len(regii)-2]
    let [s:line, s:col] = searchpos(regs)

    if (s:line == 0)
        echo 'Line:   ' . regs
    endif
    if (s:line > 0) 
        echo 'Column: ' . s:col
    endif
    echo regs

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
command! Search call DoesExist()
