; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AX,1

CALL factorielle

JMP fin

fctMul PROC
    
    MUL BX
    
    RET

factorielle PROC
                
       CMP AX,0  
       
       JE pass
       
       MOV BX,AX
       
       label:
       
       DEC BX  
       
       CMP BX,0
       
       JE finished
       
       CALL fctMul 
       
       JMP label
       
       pass: MOV AX,1  
       
       finished:
       
    RET  

factorielle ENDP 

fin:

ret