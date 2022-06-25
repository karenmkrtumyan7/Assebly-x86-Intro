%include "io.inc"

section .bss
arr resd 10000

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, ebx
    mov ecx, ebx
    cmp ebx, 1
    jne .cin
    GET_DEC 4, [arr]
    PRINT_DEC 4, [arr]
    jmp .end
    
    
.cin:
    mov esi, ebx
    sub esi, ecx
    GET_DEC 4, [arr + 4 * esi]
    loop .cin
    
    mov esi, 1
    
.loop1:
    mov eax, esi
 .loop2:
    test eax, eax
    je .L2
    mov edx, [arr + 4 * eax]
    cmp [arr + 4 * eax - 4], edx
    jl .L1
    mov edi, [arr + 4 * eax - 4]
    mov [arr + 4 * eax - 4], edx
    mov [arr + 4 * eax], edi
    
  .L1:
    dec eax
    jmp .loop2
  .L2:
    inc esi
    cmp esi, ebx
    jne .loop1
    
    
    mov ecx, ebx
.cout:
    mov esi, ebx
    sub esi, ecx
    PRINT_DEC 4, [arr + 4 * esi]
    PRINT_CHAR " "
    dec ecx
    test ecx, ecx
    jne .cout
    
.end: 
    
    xor eax, eax
    ret