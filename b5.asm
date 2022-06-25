%include "io.inc"

section .bss
max_i resd 125000
min_i resd 125000

section .data
max_l dd 0
min_l dd 0
l dd 0


section .text
global CMAIN
CMAIN:
    GET_UDEC 4, esi
    mov [l], esi  
    test esi, esi
    je .print
 
    GET_DEC 4, ebx
    GET_DEC 4, ecx
      
.loop:
    GET_DEC 4, edx
    cmp ecx, ebx
    jg .max1
    jl .min1
    jmp .end
    
.max1:
    cmp ecx, edx
    jg .max2
    jmp .end
.max2:
    mov eax, [max_l]
    mov edi, [l]
    sub edi, esi
    inc edi
    mov [max_i + 4 * eax], edi
    inc eax
    mov [max_l], eax
    jmp .end
    
.min1:
    cmp ecx, edx
    jl .min2
    jmp .end
.min2:
    mov eax, [min_l]
    mov edi, [l]
    sub edi, esi
    inc edi
    mov [min_i + 4 * eax], edi
    inc eax
    mov [min_l], eax
    jmp .end
    
.end:
    mov ebx, ecx
    mov ecx, edx
    dec esi
    cmp esi, 2
    jne .loop

.print:
    PRINT_UDEC 4, [min_l]
    NEWLINE
    mov ecx, [min_l]
    test ecx, ecx
    je .next
    
.print_min:
    mov eax, [min_l]
    sub eax, ecx
    PRINT_UDEC 4, [min_i + 4 * eax]
    PRINT_CHAR  " "
    test ecx, ecx
    dec ecx
    jg .print_min

.next:
    NEWLINE
    PRINT_UDEC 4, [max_l]
    NEWLINE
    
    mov ecx, [max_l]
    test ecx, ecx
    je .finish
.print_max:
    mov eax, [max_l]
    sub eax, ecx
    PRINT_UDEC 4, [max_i + 4 * eax]
    PRINT_CHAR  " "
    test ecx, ecx
    dec ecx
    jg .print_max
    
.finish:
    
    xor eax, eax
    ret