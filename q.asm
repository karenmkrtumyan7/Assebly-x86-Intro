%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_DEC 4, ebx
    GET_DEC 4, ecx
    mov esi, 5
    
    dec ebx
    
.loop:
    inc ebx
    mov eax, ebx
    xor edx, edx
    idiv esi
    cmp edx, 2
    je .L1
    
    cmp ebx, ecx
    jb .loop
    xor ebx, ebx
    
.L1:
    PRINT_DEC 4, ebx
    
    ;write your code here
    xor eax, eax
    ret