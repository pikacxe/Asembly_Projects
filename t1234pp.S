.section .data
    a: .long 10
    b: .long 20
    r: .long 0
.section .text
.globl main

saberi:
    pushl %ebp
    movl %esp, %ebp

    movl 8(%ebp), %eax          # smestamo a u eax
    movl 12(%ebp), %ecx         # smestamo b u ecx
    addl %ecx, %eax
    movl %ebp, %esp
    popl %ebp
    ret

main:
    pushl b
    pushl a
    call saberi
    addl $8, %esp
    movl %eax, r

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

