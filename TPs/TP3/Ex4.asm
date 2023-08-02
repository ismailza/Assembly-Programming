
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start
tab DB 12,9,50,60,59
start:

MOV CX,4   

MOV BX,SEG tab
MOV ES,BX
MOV DI,OFFSET tab

MOV AL,[DI]

label:
     
INC DI

CMP AL,[DI]
JG inf 
MOV AL,[DI]
inf:   

LOOP label

ret