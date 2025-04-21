.MODEL        SMALL
.STACK     100
.DATA
           STRING       DB 100 DUP(0)
            COUNT        DW ?
.CODE
START:        MOV       AX,@DATA
              MOV       DS,AX
              MOV       BX,0
        S1:   MOV       AH,01H
              INT       21H
              CMP       AL,0DH
              JE        S2
              MOV       STRING[BX],AL
              PUSH      AX
              INC       BX
              JMP       S1
        S2:   MOV       CX,BX
              MOV       [COUNT],CX
        S3:   POP       DX
              MOV       AH,02H
              INT       21H
              LOOP      S3

              MOV       CX,[COUNT]
              MOV       BX,0

              MOV       DL,0DH
              MOV       AH,02H
              INT       21H
              MOV       DL,0AH
              MOV       AH,02H
              INT       21H

              MOV       AH,4CH
              INT       21H
END START
