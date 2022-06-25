%include "io.inc"

section .text
global CMAIN

print:
    push ebp
    mov ebp, esp
    GET_DEC 4, eax
    
    test eax, eax
    je .end
    push eax
    call print
    pop eax
    
.L1:
    PRINT_DEC 4, eax
    PRINT_CHAR " "

.end:
    pop ebp
    ret

CMAIN:
    call print
    ;write your code here
    xor eax, eax
    ret