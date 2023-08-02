
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
JMP start
chaine DB 'Ceci est un test !$'  
compteur DB -1
start:                 
          
MOV AL,'$'  
MOV BX,SEG chaine
MOV ES,BX
MOV DI,OFFSET chaine  

DEC DI
label:   
INC DI
INC compteur
CMP [DI],AL  
JNE label

MOV AL,compteur

MOV BX,0020h  
MOV [BX],AL   


;MOV BX,CX

;REPNE SCASB
;STC
;SBB BX,CX

ret
