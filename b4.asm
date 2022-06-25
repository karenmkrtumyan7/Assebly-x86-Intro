%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebx, 1
    mov edx, 1 ;temp
    GET_UDEC 4, ecx
    cmp ecx, 1
    jbe .print
    
    GET_DEC 4, esi
    
.loop:
    GET_DEC 4, edi
    cmp edi, esi
    jng .default_edx
    inc edx    
    
    cmp ebx, edx
    jg .dec
    mov ebx, edx
    jmp .dec
    
.default_edx:
    mov edx, 1
     
.dec:
    dec ecx
    cmp ecx, 1
    mov esi, edi
    jne .loop
    
.print:
    PRINT_DEC 4, ebx
    
    ;write your code here
    xor eax, eax
    ret