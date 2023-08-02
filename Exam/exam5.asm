org 100h

JMP start

msg1 DB "Entrer l'age : $"
msg2 DB "Le prix : $"
age DB ?
prix DB ?

start:

CALL Principale

JMP fin   

; Les procedures :
    
AfficherMsg PROC 
    MOV AH,9h
    INT 21h
    RET
AfficherMsg ENDP  

AfficherC PROC
    MOV AH,6h
    INT 21h
    RET
AfficherC ENDP   

Saisir PROC
    MOV AH,00h
    INT 16h 
    CMP AL,10
    JE notc 
    MOV DL,AL
    CALL AfficherC
    notc:
    RET
Saisir ENDP  

Traitement PROC
    CMP age,2
    JLE moins2 
    
    CMP age,10
    JLE moins10 
    
    MOV prix,50
    JMP fintrait 
    
    moins2:    
    MOV prix,20 
    JMP fintrait
    
    moins10:
    MOV prix,40
    JMP fintrait
    
    fintrait:
    RET
Traitement ENDP     

RC PROC
    MOV AH,6h
    MOV DL,10
    INT 21h
    MOV DL,13
    INT 21h
    RET   
RC ENDP
    
Principale PROC 
    MOV BX,SEG msg1
    MOV DS,BX
    MOV DX,OFFSET msg1
    CALL AfficherMsg 
      
    CALL Saisir 
    MOV BH,AL
    SUB BH,'0' 
    MOV age,BH
    
    CALL Saisir
    SUB AL,'0'
    CMP AL,9
    JLE notcc 
    MOV BL,AL
    MOV AX,0
    MOV AL,age
    MOV BH,10
    MUL BH
    ADD AL,BL  
    MOV age,AL 
    notcc:  
    CALL RC
    CALL Traitement
     
    MOV BX,SEG msg2
    MOV DS,BX
    MOV DX,OFFSET msg2
    CALL AfficherMsg  
    
    MOV AX,0
    MOV AL,prix
    MOV BL,10
    DIV BL
    MOV DL,AL
    MOV BH,AH
    ADD DL,'0'
    CALL AfficherC
    MOV DL,BH    
    ADD DL,'0'
    CALL AfficherC
    
    RET
Principale ENDP

fin: RET 