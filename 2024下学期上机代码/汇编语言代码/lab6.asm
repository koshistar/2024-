data segment
    promptstringa db 'inputa:',0ah,0dh,'$'
    promptstringb db 'inputb:',0ah,0dh,'$'
    printline db 0ah,0dh,'$'

    input1 db 64,?,63 dup(0)
    input2 db 64,?,63 dup(0)

    stringc db 'replace'
    len equ $-stringc-1

    found db 0dh,0ah,'FOUND$'
    notfound db 0dh,0ah,'NOT FOUND$'
data ends

stack segment
    db 100 dup(0) 
stack ends

code segment
assume cs:code, ds:data, ss:stack
start:
    mov ax, data
    mov ds, ax
    mov es, ax

    mov ah, 09h
    mov dx, offset promptstringa
    int 21h
    mov ah, 0ah
    mov dx, offset input1
    int 21h

    mov dx,offset printline
    mov ah,09h
    int 21h

    mov ah,09h
    mov dx, offset promptstringb
    int 21h
    mov ah, 0ah
    mov dx, offset input2
    int 21h

    mov dx,offset printline
    mov ah,09h
    int 21h

    lea si, input1
    lea di, input2
    cld
    add si,02h
    add di,01h
    push si
    push di

    mov bx,es:[di]
    mov bh,0
    mov cx,ds:[si-01h]
    mov ch,0
    push cx
s1: pop cx
    pop di
    inc di
    pop si
    
    push si
    push di
    push cx

    repz cmpsb ;在input2中搜索input1
    cmp cx,0
    jz f
    sub bl,01h
    jz nf
    jmp s1

f:  mov dx, offset found
    mov ah, 09h
    int 21h
    mov dx, offset printline
    mov ah, 09h
    int 21h
    lea dx,[input2+2]
    mov bl,[input2+1]
    mov bh,0
    mov byte ptr [input2+2+bx],'$'
    mov ah, 09h
    int 21h
    mov dx, offset printline
    mov ah, 09h
    int 21h
    ;修改字符串
    pop cx
    pop di
    lea si, stringc
    mov cx,len
s2: mov ax,[si]
    mov [di], ax
    inc si
    inc di
    loop s2
    lea dx,[input2+2]
    mov bl,[input2+1]
    mov bh,0
    mov byte ptr [input2+2+bx],'$'
    mov ah, 09h
    int 21h
    jmp over
    
nf: mov dx, offset notfound
    mov ah,09h
    int 21h

over:    mov ax,4c00h
    int 21h 
code ends
end start