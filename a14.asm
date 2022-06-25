%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    GET_UDEC 4, eax
    GET_UDEC 4, ebx
    GET_UDEC 4, ecx
    GET_UDEC 4, edi
    mul ebx 
    mul ecx
    div edi
    mov esi, eax    
    
    ; verji arkxi hamar
    mov ebx, edi ; ebx = 3
    sub ebx, edx ; ebx = 3 - 2 = 1
    mov eax, ebx;  eax = 1
    xor edx, edx
    div edi
    xor eax, 1
    add esi, eax
    
    
    GET_UDEC 4, eax
    mov edi, 1
    mov ecx, 6
    xor edx, edx
    div ecx
    mov ebx, eax; ebx verji 2 bity 01 kam 00 kam 10 kam 11
    and eax, edi
    shr ebx, 1
    and ebx, edi
    or ebx, eax ; ebx kam 1 kam 0 em stanalu  
    
    mov ecx, 3
    mov eax, esi
    dec eax; 0ic indexavorelu hamar
    xor edx, edx
    div ecx
    inc eax; 0 erord arkxi hamar
    mul ebx
    sub esi, eax
    
    PRINT_UDEC 4, esi

    
    xor eax, eax
    ret