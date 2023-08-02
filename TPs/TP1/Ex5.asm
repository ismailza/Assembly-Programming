
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h
        
;1
MOV BX,0020h 
MOV WORD[BX],-0010h
  
;2
MOV AX,0003h

;3
DIV [BX]

;4
MUL WORD[BX]   

;5
MOV [BX+1],AX

ret




