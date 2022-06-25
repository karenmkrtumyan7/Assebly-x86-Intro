%include "io.inc"

section .bss
arr resd 1000

section .text
global CMAIN
getBinarZeroCount:
    push ebp
    mov ebp, esp
    xor eax, eax
    
    push edx
    mov edx, [ebp + 8]
    push ecx
    
.loop:
    mov ecx, 1
    and ecx, edx
    dec ecx
    sub eax, ecx
    shr edx, 1
    jne .loop
    
    pop ecx
    pop edx
    
    pop ebp
    ret

CMAIN:
    GET_UDEC 4, ebx
    xor esi, esi
    test ebx, ebx
    je .end    

    mov ecx, ebx
    
.cin:
    GET_UDEC 4, eax
    mov edi, ebx
    sub edi, ecx
    mov [arr + 4 * edi], eax
    loop .cin
    
    xor esi, esi
    GET_UDEC 4, edx
    
.loop2:
   mov ecx, [arr + 4 * ebx - 4]
   push ecx
   call getBinarZeroCount
   add esp, 4
   cmp eax, edx
   jne .loopend
   inc esi
   
.loopend:
    dec ebx
    jnz .loop2
    

.end: 
    PRINT_UDEC 4, esi
   
    
    xor eax, eax
    ret