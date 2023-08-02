
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h


JMP fin    
  
principale PROC  
    
    MOV BL,0
    
    label:
    
    ADD AH,BL
    
    INC BL 
    
    LOOP label
       
    RET 
   
principale ENDP
             
restitution PROC
    
    MOV DS:[300h],AH
    
    RET  
 
restitution ENDP
    
fin: 
    
PUSHA
    
MOV AH,0 
      
MOV CX,11
   
CALL principale
  
CALL restitution   
   
POPA

ret