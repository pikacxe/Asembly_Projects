.section .data
.section .text

.globl main

main:
    movl $10, %eax
    movl $5, %ebx
    movl $1, %ecx

petlja:
    cmpl %ebx,%ecx
    je kraj
    add $1,%ecx
    add $10,%eax
    jmp petlja

kraj:

    movl $1, %eax
    movl $0, %ebx
    int $0x80