%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, ebx
    GET_UDEC 4, ecx
    
    
.loop:
     xor edx, edx
     mov eax, ebx
     div ecx
     test edx, edx
     je .l1
     mov ebx, ecx
     mov ecx, edx
     jmp .mut
     
.l1: 
    PRINT_UDEC 4, ecx
    jmp .end
    
.mut:
    test ecx, ecx
    jne .loop
       
     
.end:
    ;write your code here
    xor eax, eax
    ret