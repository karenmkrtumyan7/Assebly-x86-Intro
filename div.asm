%include "io.inc"

section .text
global CMAIN
CMAIN:
    GET_DEC 4, esi
    GET_DEC 4, edi
    GET_DEC 4, eax
    GET_DEC 4, ebx
    mul edi
    mul esi
    div ebx 
    PRINT_DEC 4, eax
    ;write your code here
    xor eax, eax
    ret