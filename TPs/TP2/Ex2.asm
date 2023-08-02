
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h  

MOV [200h],2
MOV [201h],5
MOV [202h],3
MOV [203h],7
MOV [204h],2 
MOV [209h],1
MOV [20Ah],13


MOV CX,9

MOV SI,200h

MOV AL,[SI]
   

etiq:
INC SI
CMP [SI],AL
JLE max
MOV AL,[SI]
max:
LOOP etiq

ret




