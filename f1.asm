%include "io.inc"

section .bss
a resd 1
b resd 1
c resd 1
d resd 1

section .text
global CMAIN
gcd:
    push ebp
    mov ebp, esp    
    
    xor edx, edx
    mov eax, [ebp + 8]
    mov ebx, [ebp + 12]
    div ebx
    
    test edx, edx
    jne .L1
    mov eax, ebx
    jmp .L2
    
.L1:
    mov ebx, [ebp + 12]
    push edx
    push ebx
    
    call gcd
    add esp, 8
.L2:
    
    pop ebp
    ret
CMAIN:
    push ebp
    mov ebp, esp
    GET_UDEC 4, [a]
    GET_UDEC 4, [b]
    GET_UDEC 4, [c]
    GET_UDEC 4, [d]
    
    mov eax, [a]
    cmp eax, [b]
    jbe .L1
    mov ebx, [b]
    mov [a], ebx
    mov [b], eax

.L1: 

    mov eax, [c]
    cmp eax, [d]
    jbe .L2
    mov ebx, [d]
    mov [c], ebx
    mov [d], eax
    
.L2:    

    push dword [a]
    push dword [b]
    call gcd
    add esp, 8
    
    mov esi, eax
    
    
    push dword [c]
    push dword [d]
    call gcd
    add esp, 8
    
    mov edi, eax
    
    mov eax, edi
    cmp eax, esi
    jbe .L3
    mov ebx, esi
    mov edi, ebx
    mov esi, eax
    
.L3:
    
    push esi
    push edi
    call gcd
    add esp, 8
    
    PRINT_UDEC 4, eax
    
    
    xor eax, eax
    pop ebp
    ret