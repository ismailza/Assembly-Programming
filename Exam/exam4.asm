
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start

TAB DB 10,20,15,9,16,4,-1
msg1 DB "La taille de tableau est : $"
taille DB ?                           
msg2 DB "La valeur min dans le tableau est : $"
min DB ?                                       
msg3 DB "La moyenne des valeurs de tableau est : $"
moy DB ?

start:  
 
CALL Principale

JMP fin

TABTaille PROC
    MOV BX,SEG TAB
    MOV DS,BX
    MOV DI,OFFSET TAB
    
    MOV taille,0
    label1:
    CMP [DI],-1
    JE label2
    INC taille
    INC DI
    JMP label1  
    label2:
    RET
TABTaille ENDP

TABMin PROC    
    CMP taille,0
    JE vide
    MOV BX,SEG TAB
    MOV DS,BX
    MOV DI,OFFSET TAB
    
    MOV CH,0
    MOV CL,taille
    MOV AL,[DI]
    INC DI 
    DEC CX
    label3:
    CMP [DI],AL
    JGE label4
    MOV AL,[DI]  
    label4:    
    INC DI
    LOOP label3 
    MOV min,AL 
    vide:
    RET
TABMin ENDP     

TABMoy PROC
    MOV BX,SEG TAB
    MOV DS,BX
    MOV DI,OFFSET TAB  
    
    MOV CH,0
    MOV CL,taille
    MOV AX,0
    label5:
    ADD AL,[DI]
    INC DI
    LOOP label5
    DIV taille   
    MOV moy,AL
    RET
TABMoy ENDP   

Afficher PROC 
    MOV AH,9h
    INT 21h
    RET
Afficher ENDP 

AfficherR PROC 
    MOV BL,10
    DIV BL
    MOV BL,AH
    MOV DL,AL
    ADD DL,'0'
    MOV AH,6h
    INT 21h   
    MOV DL,BL 
    ADD DL,'0'
    INT 21h
    RET
AfficherR ENDP

Principale PROC   
    CALL TABTaille 
    MOV BX,SEG msg1
    MOV DS,BX
    MOV DX,OFFSET msg1
    CALL Afficher
    MOV AL,taille 
    MOV AH,0
    CALL AfficherR 
    CALL RC  
               
    CALL TABMin
    MOV BX,SEG msg2
    MOV DS,BX
    MOV DX,OFFSET msg2
    CALL Afficher
    MOV AL,min
    MOV AH,0
    CALL AfficherR 
    CALL RC 
    
    CALL TABMoy 
    MOV BX,SEG msg3
    MOV DS,BX
    MOV DX,OFFSET msg3
    CALL Afficher
    MOV AL,moy 
    MOV AH,0
    CALL AfficherR
    CALL RC 
    RET
Principale ENDP 

RC PROC
    MOV DL,10
    MOV AH,6h
    INT 21h
    MOV DL,13
    INT 21h
    RET
RC ENDP

fin:
ret 