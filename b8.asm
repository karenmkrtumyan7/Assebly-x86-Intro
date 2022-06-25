%include "io.inc"

section .bss
m1 resd 10000
m2 resd 10000
n resd 1
m resd 1
k resd 1
l1 resd 1
l2 resd 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    mov [n], eax
    mov [m], ebx
    imul eax, ebx
    mov esi, eax
    mov eax, ebx
    GET_UDEC 4, ebx
    mov [k], ebx
    imul eax, ebx
    mov edi, eax
    
    xor ecx, ecx
.cin1:
    GET_DEC 4, [m1 + ecx * 4]
    inc ecx
    cmp ecx, esi
    jne .cin1 
    
    xor ecx, ecx
.cin2:
    GET_DEC 4, [m2 + ecx * 4]
    inc ecx
    cmp ecx, esi
    jne .cin2
    
    mov [l1], esi
    mov [l2], edi
    
    xor esi, esi    

    xor eax, eax
    ret