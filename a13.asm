%include "io.inc"

section .bss
arr resd 1000000
sarr resd 1000000
c resb 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, ebx
    mov ecx, ebx   
    test ebx, ebx
    jne .cin
    jmp .end
    
.cin:
    mov esi, ebx
    sub esi, ecx
    GET_UDEC 4, [arr + 4 * esi]
    loop .cin
    
    GET_UDEC 1, [c] 
    xor esi, esi
    mov edx, ebx
    
    mov cl, [c]
    test cl, cl
    je .print
    
.loop:
    mov eax, [arr + 4 * esi]
    mov cl, 32
    mov ch, [c]
    sub cl, ch
    shl eax, cl
    mov [sarr + 4 * esi], eax
       
    mov cl, [c]
    
    mov eax, [arr + 4 * esi]
    shr eax, cl
    mov [arr + 4 * esi], eax
    
    inc esi
    cmp esi, edx
    jne .loop
    
    xor esi, esi
.loop2:
    mov eax, [sarr + 4 * esi]
    or [arr + 4 * esi + 4], eax
    
    inc esi
    cmp esi, ebx
    jne .loop2
    
    mov eax, [sarr + 4 * ebx - 4]
    or [arr], eax
    
    
.print:    
    mov ecx, ebx
.cout:
    mov esi, ebx
    sub esi, ecx
    PRINT_UDEC 4, [arr + 4 * esi]
    PRINT_CHAR " "
    dec ecx
    test ecx, ecx
    jne .cout
    
    
.end:
    
    
    xor eax, eax
    ret