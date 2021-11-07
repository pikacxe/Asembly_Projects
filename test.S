.section .data
    str_max = 50
    p1: .ascii "Molim unesite zeljeni string: (do 50 karaktera)\n"
    s1: .fill str_max,1,42
    br_c: .long 0
    p2: .ascii "Palindrom\n\n"

.section .text

.globl main

main:
    movl $4, %eax
    movl $1, %ebx
    movl $p1, %ecx
    movl $48, %edx
    int $0x80

    movl $3, %eax
    movl $0, %ebx
    movl $str_max, %edx
    leal s1, %ecx
    int $0x80

    movl $0, %esi
    subl $2, %eax

while:
    movb s1(,%eax,1), %dl
    cmpb s1(,%esi,1), %dl
    jne kraj
    je proveri

proveri:
    incl %esi
    cmpl %eax, %esi
    jbe palindrom
    decl %eax
    jmp while

palindrom:
    movl $4 , %eax
    movl $1, %ebx
    movl $11, %edx
    movl $p2, %ecx
    int $0x80


kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

