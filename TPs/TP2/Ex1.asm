
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
    
MOV [201h],4
MOV [205h],5 

 
MOV AL,0   
MOV SI,200h  





AB: 
CMP [SI],00
JNE Etiq1
INC AL;
Etiq1: INC SI;
CMP SI,20Ah
JNE AB


ret




