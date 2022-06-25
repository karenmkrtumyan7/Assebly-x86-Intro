%include "io.inc"

section .bss
a resd 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    GET_UDEC 4, ecx
    
    ; (c&a)|(!c&b)
    mov eax, ecx
    not ecx
    and ebx, ecx 
    or eax, ebx
    
    PRINT_HEX 4, eax
    ;write your code here
    xor eax, eax
    ret