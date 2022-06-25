%include "io.inc"

section .bss
t resd 1

section .text
global CMAIN
CMAIN:
    GET_DEC 4, esi
    GET_DEC 4, edi
    GET_DEC 4, ecx
    GET_DEC 4, ebx
    GET_DEC 4, [t]
    mov eax, dword [t]
    mul esi;
    mov esi, eax; 
    
    mov eax, dword [t]
    mul edi;
    mov edi, eax; 
    
    mov eax, dword [t]
    mul eax
    mov [t], eax ; t = t*t
    
    mul ecx
    mov ecx, eax
    
    mov eax, dword [t]
    mul ebx
    mov ebx, eax
    
    add esi, ecx
    add edi, ebx
    
    PRINT_DEC 4, esi
    PRINT_STRING ' '
    PRINT_DEC 4, edi
    
    
    xor eax, eax
    ret