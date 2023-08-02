
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  
      
JMP start
      
x DB 12
y DB 9
          
start: 
 
MOV AL,x
MOV AH,y 

CALL PGCD   

JMP fin

PGCD PROC
   
    label:
             
    CMP AL,AH
    
    JL inf
       
    SUB AL,AH
       
    inf: 
    
    SUB AH,AL
             
    CMP AL,AH
    
    JNE label  
    
    RET  
    
fin:

ret