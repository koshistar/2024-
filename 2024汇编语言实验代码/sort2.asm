.MODEL        SMALL
.STACK
.DATA
           SOURCENUMBERS  DB        64
              DB        0
       ARRAY  EQU       THIS BYTE
              DB        64 DUP('$')
           PROMPTSTRINGA  DB        0AH,0DH,'input string:',0AH,0DH,'$'
           PROMPTSTRINGB  DB        0AH,0DH,'output string:',0AH,0DH,'$'
.CODE
.startup
              MOV       DX,OFFSET PROMPTSTRINGA
              MOV       AH,09H
              INT       21H

              ;�������֣����������ʽ
              MOV       DX,OFFSET SOURCENUMBERS
              MOV       AH,0AH
              INT       21H

              MOV       AL, [SOURCENUMBERS+1]
              MOV       AH,0H
              MOV       CX,AX		;CX������Ԫ�ظ���
              ;�����ʾ
              MOV       DX,OFFSET PROMPTSTRINGB
              MOV       AH,09H
              INT       21H

              DEC       CX          ;Ԫ�ظ�����1Ϊ��ѭ������
      OUTLP:  MOV       DX,CX       ;DX����ѭ������
              MOV       BX,OFFSET ARRAY	;BX�ǵ�ǰ����λ�õ�ƫ��ָ��
       INLP:  					     ;ȡǰһ��Ԫ��
									;���һ��Ԫ�رȽ�
              JNA       NEXT		;ǰһ�������ں�һ��Ԫ�أ��򲻽��н���
									;���򣬽�������Ԫ��
              
       NEXT:  			            ;��һ��ѭ�����ı�BX��DX��ֵ�����벹ȫ
              
              JNZ       INLP        ;��ѭ��β�������ѭ��ʣ�����������0����ô��������ѭ����
              LOOP      OUTLP       ;��ѭ��β����������ѭ����
   OUPUTING:  MOV       DX,OFFSET ARRAY
              MOV       AH,09H
              INT       21H
.EXIT         0
              END
