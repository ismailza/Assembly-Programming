
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

MOV AL,11010110b
SHL AL,1   
MOV AH,11010110b
SHR AH,1        
MOV BL,11010110b
SAR BL,1        
MOV BH,11010110b
SAR BH,2        
MOV CL,11010110b
ROL CL,1        
MOV CH,11010110b
CLC
RCL CH,1        
MOV DL,11010110b
STC
RCR DL,1        
MOV DH,11010110b
ROR DH,1        

ret




