%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_UDEC 4 , edi
    mov ecx, 32
    mov esi, 1
    mov ebx, 0 ; counter
    
.loop: 
    mov eax, edi
    and eax, esi
    shr edi, 1
    add ebx, eax 
    loop .loop    
    
    PRINT_UDEC 4, ebx
    
    xor eax, eax
    ret