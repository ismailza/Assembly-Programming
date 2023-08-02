
; NOM : ZAHIR Ismail
; CNE : M130034716

org 100h

JMP start   
; Declaration :

mess1 DB "Delta est positif : Deux racines simples $"
mess2 DB "Delta est NULL : Une racine double $"
mess3 DB "Delta est negatif : Deux racines complexes $"
a DB 1
b DB 3
c DB 2
resmul1 DB ?
resmul2 DB ? 
delta DB ? 

start:
; main
 
CALL affiche

JMP fin:
; Procedures : 
fctMul1 PROC
    MOV AH,0
    MUL BL
    MOV resmul1,AL
    RET
fctMul1 ENDP 

fctMul2 PROC
    MOV AH,0 
    MOV AL,4
    MUL resmul1
    MOV resmul2,AL
    RET
fctMul2 ENDP   

deltaproc PROC 
    MOV AL,a
    MOV BL,c
    CALL fctMul1 
    
    CALL fctMul2
    
    MOV AL,b
    MOV BL,b
    CALL fctMul1
    
    MOV AL,resmul1
    SUB AL,resmul2
    MOV delta,AL    
    RET
deltaproc ENDP 

affiche PROC
    CALL deltaproc
    
    CMP delta,0
    JL complexe
    CMP delta,0
    JG simple:
    MOV BX,SEG mess2
    MOV DS,BX
    MOV DX,OFFSET mess2
    JMP affichage:
    simple:
    MOV BX,SEG mess1
    MOV DS,BX
    MOV DX,OFFSET mess1
    JMP affichage:
    complexe:  
    MOV BX,SEG mess3
    MOV DS,BX
    MOV DX,OFFSET mess3

    affichage: 
    MOV AH,09h
    INT 21h
    RET
affiche ENDP

fin:
ret 