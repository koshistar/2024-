;80x86<new>
DSEG    SEGMENT
MESS    DB      'Hello,World!',0DH,0AH,24H
DSEG    ENDS

SSEG    SEGMENT PARA STACK
        DW  256 DUP(?)
SSEG    ENDS

CSEG    SEGMENT
        ASSUME  CS:CSEG,DS:DSEG
BEGIN:  MOV AX,DSEG
        MOV DS,AX
        MOV DX,OFFSET MESS
        MOV AH,9

        INT 21H
        MOV AH,4CH
        INT 21H
CSEG    ENDS
        END  BEGIN