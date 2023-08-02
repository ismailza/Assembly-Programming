
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV BX,0C0BBh
ADD BX,0DDFFh 
;2)
;CLC    
;STC
;3)
CMC
MOV AX,10F0h
ADC AX,0A10h


ret




