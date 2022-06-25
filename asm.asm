%include "io.inc"

section .bss
n resd 1

section .text
global CMAIN
F:
    push ebp
    mov ebp, esp

    push ecx
    push ebx
    push esi
    mov esi, [ebp + 8]
    
    mov eax, esi
    mov ecx, 1
    xor ebx, ebx
    cmp ecx, eax
    jl .L1
    jmp .L3
.L1:
    mov eax, esi
    xor edx, edx
    idiv ecx
    test edx, edx
    je .L2
    mov eax, esi
    inc ecx
    jmp .L3
.L2:
    add ebx, ecx
    inc ecx
.L3:
    cmp ecx, esi
    jl .L1
    mov eax, ebx
    
    pop esi
    pop ebx
    pop ecx

    mov esp, ebp
    pop  ebp
    ret


CMAIN:   
    GET_UDEC 4, [n]
    mov esi, 1
    xor edi, edi
.loop:
    push esi
    call F
    add esp, 4

    cmp eax, esi
    jl .C1
    jmp .C2
.C1:
    inc esi
    inc edi
    jmp .end
.C2:
    inc esi

.end:
    cmp edi, [n]
    jl .loop 
    dec esi

    PRINT_UDEC 4, esi
    xor eax, eax
    ret