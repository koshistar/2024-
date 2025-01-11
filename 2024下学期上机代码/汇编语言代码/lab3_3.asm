datas segment
    up db 0
    equa db 0
    down db 0
    array db 8 dup(31h,21h,42h,52h, 87h,23h,98h,01h)
    printUP db 'up: $'
    printEQUA db 'equa: $'
    printDOWN db 'down: $'
    printLINE db 0Dh,0Ah,'$'
datas ends

stack segment STACK
    dw 512 dup(?)
stack ends

codes segment
    assume cs:codes,ds:datas,ss:stack
start:
    mov ax,datas
    mov ds,ax
    mov cx,8
    xor ax,ax
    lea si,array

    judge:
        mov al,[si]
        cmp al,42h
        jna euqality
        inc up
        jmp next
    euqality:
        jne less
        inc equa
        jmp next
    less:
        inc down
        jmp next
    next:
        inc si
        loop judge

    lea dx,printUP
    mov ah,09h
    int 21h
    mov dl,up
    add dl,30h
    mov ah,02h
    int 21h
    lea dx,printLINE
    mov ah,09h
    int 21h

    lea dx,printEQUA
    mov ah,09h
    int 21h
    mov dl,equa
    add dl,30h
    mov ah,02h
    int 21h
    lea dx,printLINE
    mov ah,09h
    int 21h

    lea dx,printDOWN
    mov ah,9h
    int 21h
    mov dl,down
    add dl,30h
    mov ah,02h
    int 21h
    
    lea dx,printLINE
    mov ah,09h
    int 21h
    mov dl,4ch
    int 21h

codes ends
end start 