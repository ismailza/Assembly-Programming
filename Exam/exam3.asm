org 100h

JMP start
      
T DB 4,8,16,3,1,7,12,3,9,17,30,40,3,-1 
T1 DB 20 DUP(?)
T2 DB 20 DUP(?)

somme DB ? 
N DB ? 
IsTrier DB ? 

tab DB 23 DUP(?)
      
start:    

CALL MainEx4

JMP fin 
;1. 
SommeProc PROC
    MOV BX, SEG T
    MOV DS,BX
    MOV DI, OFFSET T
    MOV somme,0
    calsomme:
    CMP [DI],-1
    JE finsomme   
    MOV AL,[DI]
    ADD somme,AL
    CMP somme,100
    JG finsomme
    INC DI
    JMP calsomme
    finsomme:
    RET
SommeProc ENDP   
;2.
IsPairProc PROC
    MOV AH,0
    MOV BL,2
    DIV BL
    RET
IsPairProc ENDP    

SeparerProc PROC 
    MOV BX,SEG T
    MOV DS,BX
    MOV DI,OFFSET T
    MOV BX,SEG T1
    MOV ES,BX
    MOV SI,OFFSET T1
    MOV BX,SEG T2
    MOV SS,BX
    MOV BP,OFFSET T2 
    
    separer: 
    CMP [DI],-1
    JE finseparer
    MOV AL,[DI]
    CALL IsPairProc
    MOV AL,[DI]
    CMP AH,00 
    JE pair                     
    MOV [SI],AL
    INC SI
    JMP impair
    pair:                  
    MOV [BP],AL
    INC BP
    impair: 
    INC DI  
    JMP separer
    finseparer:
    RET
SeparerProc ENDP     
;3.
LenT PROC
    MOV BX,SEG T
    MOV DS,BX
    MOV DI,OFFSET T
    MOV N,0
    taille:
    CMP [DI],-1
    JE fintaille
    INC N
    INC DI
    JMP taille
    fintaille:    
    RET
LenT ENDP

Tri PROC 
    MOV CH,0
    MOV CL,N
    DEC CX        
    MOV BX,SEG T
    MOV DS,BX
    MOV DI,OFFSET T
    MOV IsTrier,1
    labelt:
    MOV AL,[DI+1]
    CMP [DI],AL
    JLE istri 
    MOV IsTrier,0
    MOV AH,[DI]
    MOV [DI+1],AH
    MOV [DI],AL
    istri:
    INC DI
    LOOP labelt 
    RET
Tri ENDP

MainEx3 PROC
    CALL SeparerProc 
    CALL LenT
    label:
    CALL Tri
    CMP IsTrier,1
    JNE label
    RET
MainEx3 ENDP

; Exercice 4

LireC PROC  
    MOV AH,00h
    INT 16h
    MOV DL,AL
    RET 
LireC ENDP

AfficherC PROC
    MOV AH,6h
    INT 21h    
    RET
AfficherC ENDP

MainEx4 PROC
    MOV CX,22 
    MOV BX,SEG tab
    MOV DS,BX
    MOV DI,OFFSET tab
    chaine:
    CALL LireC
    MOV [DI],DL
    INC DI
    CALL AfficherC   
    CMP DL,'$'
    JE finchaine
    LOOP chaine 
    finchaine:
    RET
MainEx4 ENDP

fin: ret