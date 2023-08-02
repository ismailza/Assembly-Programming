
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start

msg1 DB "Entrer la valeur de X : $"
msg2 DB "Entrer la valeur de Y : $"

start:

MOV BX,SEG msg1
MOV DS,BX
MOV DX,OFFSET msg1

CALL fnct

MOV BX,SEG msg2
MOV DS,BX
MOV DX,OFFSET msg2  

CALl fnct

JMP fin
    
Lire PROC
    
    MOV AH,00h
    
    INT 16h 
    
    RET    
    
AfficheC PROC
    
    MOV AH,6h
    
    MOV DL,AL
    
    INT 21h
       
    RET  
    
AfficheS PROC
    
    MOV AH,9h
    
    INT 21h   
    
    RET
    
RC PROC
       
    MOV AH,6h 
    
    MOV DL,10
    
    INT 21h 
    
    MOV AH,6h 
    
    MOV DL,13
    
    INT 21h
    
    RET  
    
fnct PROC
    
    CALL AfficheS

    CALL Lire
    
    CALL AfficheC
    
    CALL RC
       
    RET
    
fin:

ret