
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV [200h],1
MOV [300h],2  
MOV [201h],3
MOV [301h],4  
MOV [202h],500
MOV [302h],2  
MOV [203h],6
MOV [303h],1  
MOV [204h],7
MOV [304h],1  
MOV [205h],6
MOV [305h],1       
 
MOV CX,10 
MOV SI,0  
MOV DI,0

MOV BL,0

etiq:
     
MOV AX,B[200h+SI]
MUL [300h+SI]

MOV WORD[400h+DI],AX
   
INC SI 
INC DI
INC DI

LOOP etiq
 
ret




