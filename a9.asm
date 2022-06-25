%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 4, ebx
    cmp ebx, 0
    jg .st1
    dec ebx
    not ebx
.st1:
    PRINT_DEC 4, ebx
    ;write your code here
    xor eax, eax
    ret