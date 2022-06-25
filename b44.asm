%include "io.inc"

section .data
oct dd  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, ebx
    mov ecx, 0
    xor esi, esi;result
    
.loop:
    mov eax, 7 ;0111
    and eax, ebx
    mov [oct + 4 * ecx], eax
    
    inc ecx
    shr ebx, 3
    test ebx, ebx
    jne .loop
    
    
.print: 
    mov eax, ecx
    dec eax
    PRINT_DEC 4, [oct + 4 * eax]
    dec ecx
    jne .print
    
    ;write your code here
    xor eax, eax
    ret