
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

;1
MOV AL,15 
MOV BL,20
MUL BL
  
;2 
MOV AL,15
MOV BL,-20
IMUL BL

;3
MOV AL,115
MOV BL,-10
IMUL BL

;4
MOV AX,115
MOV BX,-10
IMUL BX
                     
;5
MOV AX,93
MOV BL,3
DIV BL

;6
MOV AX,520
MOV BL,-10 
IDIV BL

;7
MOV AX,520
MOV BX,-10
IDIV BX



ret