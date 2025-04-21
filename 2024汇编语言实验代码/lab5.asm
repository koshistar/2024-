data segment
    ;printChar db "? "
    printLine db 0dh,0ah,"$"
data ends

stack segment 
    db 16 dup(0)
stack ends

code segment
    assume cs:code,ds:data,ss:stack
    start:
        mov ax,data
        mov ds,ax
        xor ax,ax
        mov bx,0010h

        mov cx,15
        s1:
            push cx

            mov cx,16
            s2:
                mov dl,bl
                mov ah,02h
                int 21h
                mov dl,20h
                mov ah,02h
                int 21h
                inc bl
                loop s2

            mov dx,offset printLine
            mov ah,09h
            int 21h
            pop cx
            loop s1 

        mov ax,4c00h
        int 21h
code ends
end start