
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h   


MOV [201h],22
MOV [203h],-12
MOV [205h],23


MOV SI,200h

etiq:

CMP [SI],0

JE e
JG g
JL l  

e: INC AL
JMP i 

g: INC AH
JMP i  

l: INC BH  

i: INC SI
CMP SI,20Ah
JNE etiq




ret