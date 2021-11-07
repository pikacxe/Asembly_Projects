.section .data
    string_max = 40
    s1: .fill string_max, 1, 42
    br_ucitanih_karaktera: .long 0


.section .text
.globl main

main:
    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $string_max,%edx
    int $0x80

    movl %eax, br_ucitanih_karaktera
    movl $4, %eax
    movl $1, %ebx
    movl $s1, %ecx
    movl br_ucitanih_karaktera, %edx
    int $0x80



kraj:

    movl $1, %eax
    movl $0, %ebx
    int $0x80