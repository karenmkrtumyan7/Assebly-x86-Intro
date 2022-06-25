%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    GET_UDEC 1, bl
    mov cl, 32
    sub cl, bl
    shl eax, cl
    shr eax, cl
    PRINT_UDEC 4, eax
    ;write your code here
    xor eax, eax
    ret