
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start
 
msg1 DB "Entrer la valeur de l'hypotenuse : $"
msg2 DB "Entrer la valeur du premier Arc : $"
msg3 DB "Entrer la valeur du deuxieme Arc : $"
msg4 DB "Triangle $"
rec DB "Rectangle $"
iso DB "Isocele $"
equ DB "Equilateral $"
smp DB "Simple $" 
      
start:   

MOV DI,300h    

MOV BX,SEG msg1
MOV DS,BX
MOV DX,OFFSET msg1
CALL fnct  

MOV BX,SEG msg2
MOV DS,BX
MOV DX,OFFSET msg2
CALL fnct
     
MOV BX,SEG msg3
MOV DS,BX
MOV DX,OFFSET msg3
CALL fnct 

CALL typeTriangle
                  
JMP fin  

Lire PROC
    MOV AH,00h
    INT 16h
    MOV CL,AL
    SUB CL,'0'
    MOV [DI],CL                                                                   
    INC DI  
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
 
typeTriangle PROC
    
    MOV DI,300h
    MOV AH,[DI+1]
    MOV AL,[DI+2]
    CMP AH,AL
    JNE notisocel 
    
    CMP AH,[DI]
    JE equilateral  
        
    MOV AX,[DI+1]
    MUL AX
    MOV BX,AX
    MOV AX,[DI+2]
    MUL AX
    ADD BX,AX
    MOV AX,[DI]
    MUL AX    
    CMP AX,BX
    JE isorectangle
    
    notisocel: 
    MOV DI,300h   
    MOV AL,[DI+1] 
    MOV AH,00h
    MUL AX
    MOV BX,AX  
    MOV AL,[DI+2] 
    MOV AH,00h
    MUL AX
    ADD BX,AX
    MOV AL,[DI]
    MOV AH,00h
    MUL AX    
    CMP AX,BX
    JE rectangle   
    
    ; triangle simple
    simple:
    MOV BX,SEG msg4
    MOV DS,BX
    MOV DX,OFFSET msg4
    CALL AfficheS 
    MOV BX,SEG smp
    MOV DS,BX
    MOV DX,OFFSET smp
    CALL AfficheS
    JMP fintype      
    
    ; triangle equilateral
    equilateral: 
    MOV BX,SEG msg4
    MOV DS,BX
    MOV DX,OFFSET msg4
    CALL AfficheS
    MOV BX,SEG equ
    MOV DS,BX
    MOV DX,OFFSET equ
    CALL AfficheS 
    JMP fintype    
    
    ; triangle isocel rectangle
    isorectangle:
    MOV BX,SEG msg4
    MOV DS,BX
    MOV DX,OFFSET msg4
    CALL AfficheS
    MOV BX,SEG iso
    MOV DS,BX
    MOV DX,OFFSET iso
    CALL AfficheS 
    MOV BX,SEG rec
    MOV DS,BX
    MOV DX,OFFSET rec
    CALL AfficheS 
    JMP fintype    
    
    ; triangle rectangle
    rectangle:
    MOV BX,SEG msg4
    MOV DS,BX
    MOV DX,OFFSET msg4
    CALL AfficheS 
    MOV BX,SEG rec
    MOV DS,BX
    MOV DX,OFFSET rec
    CALL AfficheS 
    JMP fintype  
    
    fintype:
    RET
     
   
    
fnct PROC
    CALL AfficheS   
    CALL Lire
    CALL AfficheC
    CALL RC
    RET
        
fin: ret                                                            