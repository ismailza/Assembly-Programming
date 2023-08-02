
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start
n DB 3
X DB 2
start:

CALL principale

JMP fin

fctMul PROC
       
    MUL X
    
    RET  
    
principale PROC
    
    MOV CL,n
    MOV AL,1  
    
    label:
    
    CALL fctMul
    
    LOOP label  
    
    RET  
    
fin:
    
ret