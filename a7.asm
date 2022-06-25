%include "io.inc"

section .bss
a resb 1
b resb 1
c resb 1
d resb 1


section .text
global CMAIN
CMAIN:
    GET_UDEC 1, [a]
    GET_UDEC 1, [b]
    GET_UDEC 1, [c]
    GET_UDEC 1, [d]
     
    movzx eax, byte [d]
    shl eax, 8
   
    or eax, [c]
    shl eax, 8
    
    or eax, [b]
    shl eax, 8
    
    or eax, [a]
    PRINT_UDEC 4, eax
    
    ;write your code here
    xor eax, eax
    ret