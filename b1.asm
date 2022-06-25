%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, ecx
    mov ebx, -2147483648 ;max
    mov esi, ebx ;mid
    mov edi, ebx ;min
    
.loop:
    GET_DEC 4, eax
    cmp eax, ebx
    jge .max
    cmp eax, esi
    jge .mid
    cmp eax, edi
    jge .min
    jmp .end
.max:
    mov edi, esi
    mov esi, ebx
    mov ebx, eax
    jmp .end
.mid:
    mov edi, esi
    mov esi, eax
    jmp .end
.min:
    mov edi, eax
    jmp .end
.end:
    dec ecx
    test ecx, ecx
    jne .loop
    
PRINT_DEC 4, ebx
PRINT_CHAR ' '
PRINT_DEC 4, esi
PRINT_CHAR ' '
PRINT_DEC 4, edi
    
    xor eax, eax
    ret