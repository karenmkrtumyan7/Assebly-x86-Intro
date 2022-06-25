%include "io.inc"

section .bss
x1 resd 1
y1 resd 1
x2 resd 1
y2 resd 1
x3 resd 1
y3 resd 1

section .text
global CMAIN
CMAIN:
    GET_UDEC 4, [x1]
    GET_UDEC 4, [y1]
    GET_UDEC 4, [x2]
    GET_UDEC 4, [y2]
    GET_UDEC 4, [x3]
    GET_UDEC 4, [y3]
    
    mov eax, [x1]
    sub eax, [x3] ; x1 - x3
    
    mov ebx, [y2]
    sub ebx, [y3] ; y2 - y3
    
    mov ecx, [y1]
    sub ecx, [y3] ; y1 - y3
    
    mov esi, [x2]
    sub esi, [x3] ; x2 - x3
    
    mul ebx
    mov ebx, eax
    
    mov eax, ecx
    mul esi
    
    sub eax, ebx
    
    ;PRINT_DEC 4, eax
    
   ;modul 
   
    cdq
    xor eax, edx
    sub eax, edx
   
    
    mov esi, 2
    xor edx, edx
    div esi
    mov edi, eax ; amboxj mas
    
    mov ecx, 10
    mov eax, edx
    xor edx, edx
    mul ecx
    xor edx, edx
    div esi 
    
    PRINT_UDEC 4, edi
    PRINT_CHAR '.'
    PRINT_UDEC 4, eax
    
    xor eax, eax
    ret