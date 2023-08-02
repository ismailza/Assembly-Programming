
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

A DB 10
CMP A,0    
INC A
JG test1
INC A
test1:
MOV AL,A
ret




