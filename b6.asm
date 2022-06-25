%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    GET_UDEC 1, dl
    mov cl, 32
    sub cl, dl
    xor edx, edx ;result
.loop:
    mov ebx, eax
    shl ebx, cl
    shr ebx, cl
    cmp ebx, edx
    jna .end
    mov edx, ebx
    
.end:
    shr eax, 1
    test eax, eax
    jne .loop
    
    PRINT_UDEC 4, edx
    
    
    ;write your code here
    xor eax, eax
    ret