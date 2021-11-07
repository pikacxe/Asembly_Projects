.section .data
.section .text

.globl main

main:
    movl $10, %eax
    movl $5, %ebx
    movl $0, %ecx

petlja:
    cmpl $0, %eax
    je kraj
    sub %ebx,%eax
    add $1,%ecx
    jmp petlja

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80