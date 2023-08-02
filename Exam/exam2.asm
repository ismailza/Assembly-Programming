
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start

TPages DB 20,12,120,2,45,-1
TSpirale DB 1,0,1,0,0
TPrix DB 30 DUP(?)
NBRClient DW ?
PrixSpiraleTmp DB ?  
PrixCopieTmp DB ?  
PrixTotTmp DB ? 
CAparJour DB ?

start: 
    
CALL MAINProc       

JMP fin 

NBRClientProc PROC
    MOV NBRClient,0
    MOV BX,SEG TPages
    MOV DS,BX
    MOV BX, OFFSET TPages
    label1:   
    
        CMP [BX],-1
        JE finlabel1   
        INC NBRClient
        INC BX
    
    JMP label1   
    finlabel1:
    RET
NBRClientProc ENDP 
                                      
PrixSpiraleProc PROC
    MOV PrixSpiraleTmp,0
    CMP BH,0
    JE nospirale
    MOV PrixSpiraleTmp,10
    nospirale:
    RET
PrixSpiraleProc ENDP   

PrixCopieProc PROC
    CMP BL,40
    JG promo
    MOV PrixCopieTmp,BL  
    JMP nopromo
    promo:   
    MOV AH,0          
    SUB BL,40
    MOV AL,BL    
    MOV BL,2
    DIV BL
    ADD AL,40 
    MOV PrixCopieTmp,AL 
    nopromo:
    RET
PrixCopieProc ENDP

TotCltProc PROC 
    CALL PrixCopieProc
    CALL PrixSpiraleProc  
    MOV AL,PrixCopieTmp
    ADD AL,PrixSpiraleTmp  
    MOV PrixTotTmp,AL
    RET
TotCltProc ENDP 

CAParJourProc PROC
    MOV CX,NBRClient   
    MOV BX,SEG TPrix
    MOV DS,BX
    MOV DI,OFFSET TPrix  
    MOV AL,0
    CAJCalcul:
    ADD AL,[DI]
    INC DI
    LOOP CAJCalcul 
    MOV CAparJour,AL
    RET             
CAParJourProc ENDP    

MAINProc PROC
    CALL NBRClientPROC
    
    MOV CX,NBRClient 
    MOV BX,SEG TPrix
    MOV DS,BX
    MOV DI,OFFSET TPrix 
    
    MOV BX,SEG TSirale
    MOV ES,BX
    MOV SI,OFFSET TSpirale    
    
    MOV BX,SEG TPages
    MOV SS,BX  
    MOV BP,OFFSET TPages
    
    alimentTPrix: 
    MOV BH,[SI]
    MOV BL,[BP]
    
    CALL TotCltProc  
    MOV BL,PrixTotTmp
    MOV [DI],BL
    INC DI 
    INC SI
    INC BP
    LOOP alimentTprix  
    
    CALL CAParJourProc
    RET
MAINProc ENDP
    

fin: ret