assume cs:lab3

lab3 segment
    mov ax,2000H
    mov ss,ax
    mov sp,0010H
    mov ax,10H
    mov cx,7
s1: push ax
    inc ax
    loop s1
    push ax

    mov bx,0H
    mov cx,8
s2: pop ax
    add bx,ax
    loop s2
    mov dx,bx
lab3 ends

end