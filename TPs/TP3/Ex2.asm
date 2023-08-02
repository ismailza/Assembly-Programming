
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
JMP start
conteur DB 0   
start:
MOV CX,10
label:
INC conteur
loop label
MOV AL,conteur 

;Etq:
;INC conteur
;CMP conteur,10
;JNE Etq  
;MOV Al,conteur

ret