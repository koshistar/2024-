data  segment
    array db 31h,21h,42h,52h,87h,23h,98h,01h
    up db 0
    equa db 0
    down db 0
    upString db 0ah,0dh,'Up Number:$'
    downString db 0ah,0dh,'Down Number:$'
    equaString db 0ah,0dh,'Equivalent Number:$'
data ends
stack segment
    dw 512 dup(?)
stack ends
code segment 
    assume cs:code,ds:data,ss:stack
    start:
        mov ax,data
        mov ds,ax
        mov bx,0
        xor ax,ax
        mov cx,8
    larger:
        mov al,array[bx]
        cmp al,42h
        jna equality
        inc up
        jmp next
    equality:
        jne less
        inc equa
        jmp next
    less:
        inc down
        jmp next
    next:
        inc bx
        loop larger
        
    mov dx,offset upString
    mov ah,09h
    int 21h
    add up,30h
    mov dl,up
    mov ah,02h
    int 21h

    mov dx,offset equaString
    mov ah,09h
    int 21h
    add equa,30h
    mov dl,equa
    mov ah,02h
    int 21h

    mov dx,offset downString
    mov ah,09h
    int 21h
    add down,30h
    mov dl,down
    mov ah,02h
    int 21h

    mov ax,4c00h
    int 21h
code ends
    end start 