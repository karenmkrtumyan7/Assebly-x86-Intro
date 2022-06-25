%include "io.inc"

section .bss
n resd 1
arr resd 100000

section .text
global CMAIN
div3:
    push ebp
    mov ebp, esp

    mov eax, [ebp + 8]
    test eax, eax
    je .print
    mov ecx, 10
    xor ebx, ebx
    xor edi, edi
.L1:
    xor edx, edx
    
    idiv ecx
    mov [arr + 4 * ebx], edx
    inc ebx
    add edi, edx
    test eax, eax
    jne .L1
    mov eax, edi
    xor edi, edi
    cmp eax, 10
    jge .L1
    cmp eax, 3
    je .print
    
    cmp eax, 6
    je .print
    
    cmp eax, 9
    je .print
    jmp .L2
    .print:
    
    PRINT_STRING "YES"
    NEWLINE
    jmp .end
.L2:
    PRINT_STRING "NO"
    NEWLINE
.end:
    pop ebp
    ret


CMAIN:
    GET_UDEC 4, [n]
    xor ebx, ebx
    mov ecx, [n]
.L3:
    mov eax, [arr + 4 * ebx]
    GET_UDEC 4, eax
    push ebx
    push eax
    call div3
    add esp, 4
    pop ebx
    inc ebx
    cmp ebx, [n]
    jl .L3
    xor eax, eax
    ret