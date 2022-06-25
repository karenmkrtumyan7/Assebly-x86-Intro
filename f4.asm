%include "io.inc"

section .text
global CMAIN

print:
    push ebp
    mov ebp, esp
    GET_DEC 4, eax
    
    test eax, eax
    je .end
    
    mov ebx, [ebp + 8]
    and ebx, 1
    
    test ebx, ebx
    jne .L1
    PRINT_DEC 4, eax
    PRINT_CHAR " "
.call:
    push eax
    mov edx, [ebp + 8]
    inc edx
    push edx
    call print
    add esp, 4
    pop eax
    jmp .end
    
.L1:    
    test eax, eax
    je .end
    push eax
    mov edx, [ebp + 8]
    inc edx
    push edx
    call print
    add esp, 4
    pop eax
    
    PRINT_DEC 4, eax
    PRINT_CHAR " "

.end:
    pop ebp
    ret

CMAIN:
    xor esi, esi
    push esi
    call print
    add esp, 4
    ;write your code here
    xor eax, eax
    ret