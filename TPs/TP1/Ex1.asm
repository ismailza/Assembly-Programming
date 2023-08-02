
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AL,01100001b
AND AL,11011111b

MOV AH,01100001b
OR AH,01110110b

MOV BL,01100001b
NOT BL

MOV BH,01100001b
XOR BH,01010101b

ret




