%include "io.inc"

section .bss
ham resd 12
hayt resd 12
l resd 1

section .text
global CMAIN

gcd:
    push ebp
    mov ebp, esp
    
    push edx
    push ebx    
    
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
    
    pop ebx
    pop edx
    pop ebp
    ret

CMAIN:
    GET_UDEC 4, ebx
    cmp ebx, 1
    jg .start
    GET_UDEC 4, edi
    GET_UDEC 4, esi
    jmp .result
    
.start:
    mov [l], ebx
    xor edx, edx
    
.cin:
    GET_UDEC 4, esi
    GET_UDEC 4, edi
    mov [ham + 4 * edx], esi
    mov [hayt + 4 * edx], edi
    inc edx
    cmp edx, ebx
    jne .cin
    
    mov esi, [hayt]
    mov edx, 1
    
.loop:
    mov edi, [hayt + 4 * edx]
    push esi
    push edi
    call gcd
    add esp, 8
    imul edi, esi
    mov ecx, eax
    mov eax, edi
    push edx
    xor edx, edx
    div ecx
    pop edx
    cmp eax, ecx
    jg .L3
    
.L3:
    mov esi, eax
.L4:
    inc edx
    cmp edx, [l]
    jne .loop
    
;PRINT_UDEC 4, esi
;NEWLINE

    xor ecx, ecx
    xor edi, edi ; gumari hamarich
    
.loop2:
    mov eax, esi
    xor edx, edx
    mov ebx, [hayt + 4 * ecx]
    div ebx
    imul eax, [ham + 4 * ecx]
    add edi, eax
    inc ecx
    cmp ecx, [l]
    jne .loop2
    
;PRINT_UDEC 4, edi

    push edi
    push esi
    call gcd
    add esp, 8
    mov ebx, eax
    ;mov edx, eax
    mov eax, edi
    div ebx
    mov edi, eax
    
    mov eax, esi
    div ebx
    mov esi, eax

.result:
    PRINT_UDEC 4, edi
    PRINT_CHAR " "
    PRINT_UDEC 4, esi
    
    xor eax, eax
    ret