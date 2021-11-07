.section .data
    string: .ascii "  Neki string  "

.section .text
.globl main

main:
    movl $string,%eax

petlja:
    movb (%eax), %bl
    cmpb $32, (%eax)
    jne kraj
    incl %eax
    jmp petlja

kraj:
    movl %eax, string
    movl $1, %eax
    movl $0, %ebx
    int $0x80
