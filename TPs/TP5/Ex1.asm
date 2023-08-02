
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h



label: 
MOV AH,0h

INT 16h

MOV DL,AL 

MOV AH,06h

INT 21h
          
CMP AL,'Q'

JNE label



ret




