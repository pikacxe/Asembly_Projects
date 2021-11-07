.section .data
    a: .long 20
    b: .long 10 
    r: .long 0


.section .text

.globl main

saberi:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx

    movl 8(%ebp), %eax
    movl 12(%ebp), %ebx
    addl %ebx, %eax

saberi_kraj:
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret
main:
    pushl b
    pushl a
    call saberi
    addl $8, %esp

kraj:
    movl $1, %eax
    movl $2, %ebx
    int $0x80
