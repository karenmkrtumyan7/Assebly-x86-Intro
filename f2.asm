%include "io.inc"

section .text
global CMAIN

calcCount:
    push ebp
    mov ebp, esp
    
    mov eax, [ebp + 8]
    mov ebx, 3
    xor edx, edx
    div ebx 
    
    cmp eax, 0
    je .L1
    push edx
    push eax
    call calcCount
    add esp, 4
    pop edx
    cmp edx, 1
    jne .end
    
.L1:
    cmp edx, 1
    jne .end
    ;PRINT_UDEC 4, EDX
    ;PRINT_CHAR " "
    add eax, edx
    
    
.end:        
    pop ebp
    ret

CMAIN:
    GET_UDEC 4, esi
    push esi
    call calcCount
    PRINT_UDEC 4, eax
    
    pop esi
    xor eax, eax
    ret