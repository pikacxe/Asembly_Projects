.section .data
    NELEM = 5
    niz: .long 3,56,111,-3,10
    max: .long 0

.section .text
.globl main

main:
    movl $0 , %esi
    movl $0, %eax
    movl niz(,%esi,4), %eax
petlja:
    incl %esi
    cmpl niz(,%esi,4), %eax
    jge zameni
    cmpl $NELEM, %esi
    jl petlja
zameni: 
    movl niz(,%esi,4), %eax
    jmp petlja


kraj:
    movl %eax,max
    movl $1, %eax
    movl $0, %ebx
    int $0x80