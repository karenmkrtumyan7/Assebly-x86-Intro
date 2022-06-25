%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    xor edi, edi
    xor edx, edx
    
.loop1:
    mov ecx, eax
    xor edx, edx
    .loop2:
        mov esi, 1
        and esi, ecx
        dec esi
        sub edx, esi
        shr ecx, 1
        test ecx, ecx
        jne .loop2
    
    cmp edx, ebx
    je .L1
    jne .L2
    
.L1:
    inc edi
.L2:
    dec eax
    test eax, eax
    jne .loop1
    
    PRINT_DEC 4, edi
    
    ;write your code here
    xor eax, eax
    ret