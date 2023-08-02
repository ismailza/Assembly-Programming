
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

JMP start:

TEtud DB 'Beni','Badi','Toto','$'

TNote DB 10,15,12

TMention DB 20 DUP (?)

NbrEtud DB ?  

NbrMent DB ? 

NoteMax DB ?

NoteMin DB ?

NoteAvg DB ? 

TStatique DB 16 DUP (?)

start:
    
CALL MainProc  
                
MOV AL,NoteMax
MOV AH,NoteMin
MOV BL,NoteAvg   
MOV BH,NbrEtud 

lea dx,NoteMax
    
JMP fin

NbrEtudProc PROC
    MOV BX,SEG TEtud
    MOV ES,BX
    MOV DI,OFFSET TEtud
    MOV NbrEtud,-1
    SUB DI,4
    calNbr:
    INC NbrEtud  
    ADD DI,4
    CMP [DI],'$' 
    JNE calNbr
    RET    
NbrEtudProc ENDP

TMentionProc PROC
    MOV CL,NbrEtud
    MOV CH,0   
    MOV BX,SEG TNote
    MOV DS,BX
    MOV SI,OFFSET TNote 
      
    MOV BX,SEG TMention
    MOV ES,BX
    MOV DI,OFFSET TMention  
    
    metterMention:
    CMP [SI],10
    JL AJ
    CMP [SI],12
    JL PA:
    CMP [SI],14
    JL AB
    CMP [SI],16
    JL BI
    
    ; TB
    MOV [DI],'TB'
    JMP affectee
        
    BI:  
    MOV [DI],'BI'
    JMP affectee
    
    AB:  
    MOV [DI],'AB'
    JMP affectee
    
    PA:
    MOV [DI],'PA'
    JMP affectee 
    
    AJ:     
    MOV [DI],'AJ'
    JMP affectee 
    
    affectee:
    ADD DI,2
    MOV [DI],'$' 
    INC SI
    
    LOOP metterMention
    RET  
TMentionProc ENDP            
    
NbrMentionProc PROC 
    MOV BX,SEG TMention
    MOV DS,BX
    MOV SI,OFFSET TMention
    
    MOV CL,NbrEtud 
    MOV CH,0
    MOV NbrMent,0
    cal:
    CMP AX,[SI]
    JNE notM
    INC NbrMent
    notM: 
    ADD SI,2
    LOOP cal:
    
    RET 
NbrMentionProc ENDP 
    
MaxNoteProc PROC
    MOV CL,NbrEtud
    DEC CL
    MOV CH,00h  
    MOV BX,SEG TNote
    MOV DS,BX
    MOV SI,OFFSET TNote   
    
    MOV AL,[SI]
    MOV NoteMax,AL
    
    calMax:
    INC SI  
    MOV AL,[SI]
    CMP NoteMax,AL
    JG notmax
    MOV NoteMax,AL
    notmax:
    LOOP calMax
    RET 
MaxNoteProc ENDP       
    
MinNoteProc PROC
    MOV CL,NbrEtud
    DEC CL
    MOV CH,00h  
    MOV BX,SEG TNote
    MOV DS,BX
    MOV SI,OFFSET TNote
        
    MOV AL,[SI]
    MOV NoteMin,AL
    
    calMin:
    INC SI  
    MOV AL,[SI]
    CMP NoteMin,AL
    JL notmin
    MOV NoteMin,AL
    notmin:
    LOOP calMin
    RET
MinNoteProc ENDP    
    
AvgNoteProc PROC
    MOV CL,NbrEtud
    MOV CH,00h  
    MOV BX,SEG TNote
    MOV DS,BX
    MOV SI,OFFSET TNote   
    MOV AX,0
    calavg:
    ADD AL,[SI] 
    INC SI    
    LOOP calavg
    DIV NbrEtud
    MOV NoteAvg,AL
    RET 
AvgNoteProc ENDP
    
StatiqueProc PROC  
    MOV BX,SEG TStatique
    MOV ES,BX
    MOV DI,OFFSET TStatique 
        
    MOV AX,'TB'
    CALL NbrMentionProc 
    MOV AL,NbrMent
    MOV [DI],AL
    INC DI
    
    MOV AX,'BI'
    CALL NbrMentionProc
    MOV AL,NbrMent
    MOV [DI],AL
    INC DI
    
    MOV AX,'AB'
    CALL NbrMentionProc
    MOV AL,NbrMent
    MOV [DI],AL
    INC DI   
    
    MOV AX,'PA'
    CALL NbrMentionProc
    MOV AL,NbrMent
    MOV [DI],AL
    INC DI    
    
    MOV AX,'AJ'
    CALL NbrMentionProc
    MOV AL,NbrMent
    MOV [DI],AL
    INC DI 
    
    CALL MaxNoteProc 
    MOV AL,NoteMax 
    MOV [DI],AL
    INC DI
    
    CALL MinNoteProc
    MOV AL,NoteMin
    MOV [DI],AL
    INC DI          
    
    CALL AvgNoteProc 
    MOV AL,NoteAvg
    MOV [DI],AL
    INC DI
    
    RET 
StatiqueProc ENDP    
    
MainProc PROC
    CALL NbrEtudProc   
    CALL TMentionProc
    CALL NbrMentionProc
    CALL StatiqueProc
    RET 
MainProc ENDP

fin: ret     