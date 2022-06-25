%include "io.inc"



section .text
global CMAIN
reverse:
    push ebp
    mov ebp, esp
    
    push esi
    push edi
    push eax
    push ebx
    push edx
    
    mov ebx, [ebp + 8]
    xor esi, esi ;reversed_number
    xor edi, edi ; remainder
    
    
.loop:
    test ebx, ebx
    je .loopend
    xor edx, edx
    mov eax, ebx
    mov ecx, 10
    div ecx
    mov edi, edx
    mov eax, esi
    mul ecx
    add eax, edi
    mov esi, eax
    mov eax, ebx
    div ecx
    mov ebx, eax
    
    test ebx, ebx
    jnz .loop
    
    
    
.loopend:
    mov ecx, esi 
    pop edx
    pop ebx
    pop eax
    pop edi
    pop esi
    mov eax, ecx
    
    pop ebp
    ret    
CMAIN:
    GET_UDEC 4, ebx
    GET_UDEC 4, esi
    test ebx, ebx
    je .L1
    test esi, esi
    je .check

.loop2:
    push ebx
    call reverse
    add esp, 4
    mov edi, eax
    
    ;PRINT_UDEC 4, eax
    ;PRINT_CHAR " "
    ;PRINT_UDEC 4, ebx
    ;NEWLINE
    ;cmp eax, ebx
    ;je .L1
    
    mov eax, ebx
    add ebx, edi
    
    dec esi
    jne .loop2
    
    
.check:
    push ebx
    call reverse
    add esp, 4
    mov edi, eax
    cmp eax, ebx
    je .L1
    
    cmp eax, ebx
    je .L1
    JMP .L2
    
.L1:
    PRINT_STRING "Yes"
    NEWLINE
    PRINT_UDEC 4, ebx
    jmp .end
.L2:
    PRINT_STRING "No"
    
    
.end:
    
    
    xor eax, eax
    ret