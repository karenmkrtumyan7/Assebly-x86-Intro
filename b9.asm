%include "io.inc"

section .bss
x1 resw 1
y1 resw 1
x2 resw 1
y2 resw 1
x3 resw 1
y3 resw 1
x4 resw 1
y4 resw 1
x resw 1
y resw 1

section .text
global CMAIN
CMAIN:
    GET_DEC 2, [x1]
    GET_DEC 2, [y1]
    GET_DEC 2, [x2]
    GET_DEC 2, [y2]
    GET_DEC 2, [x3]
    GET_DEC 2, [y3]
    GET_DEC 2, [x4]
    GET_DEC 2, [y4]
    GET_DEC 2, [x]
    GET_DEC 2, [y]
    

    mov ax, word [x1]
    mov bx, word [x2]
    cmp ax, bx
    jne .X2
    
.X1:
    mov bx, word [x3]
.X2:
    cmp bx, [x]
    jg .X3
    jl .X4
    jmp .X5
.X3:
    cmp ax, [x]
    jl .X6
    jmp .X5
.X4:
    cmp ax, [x]
    jg .X6
    jmp .X5
.X5:
    PRINT_STRING "NO"
    jmp .end
.X6:

    mov ax, word [y1]
    mov bx, word [y2]
    cmp ax, bx
    jne .Y2
    
.Y1:
    mov bx, word [y3]
.Y2: 
    cmp bx, [y]
    jg .Y3
    jl .Y4
    jmp .Y5
.Y3:
    cmp ax, [y]
    jl .Y6
    jmp .Y5
.Y4:
    cmp ax, [y]
    jg .Y6
    jmp .Y5
.Y5:
    PRINT_STRING "NO"
    jmp .end
.Y6:
    PRINT_STRING "YES"

.end:
    xor eax, eax
    ret