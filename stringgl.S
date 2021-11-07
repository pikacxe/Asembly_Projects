.section .data
    s1: .ascii " a a a \0"
    br_s1 = . - s1
    rez: .long 0
.section .text
.globl main


main:
    pushl $br_s1
    pushl $s1
    call broji_string_start
    addl $8, %esp
    movl %eax, rez

kraj:
    movl $1, %eax
    movl rez, %ebx
    int $0x80



