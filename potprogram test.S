.section .data
    s1: .ascii "Nesto glupo\0"
    br_s1 = . - s1
.section .text
.global main


nesto:
    pushl %ebp
    movl %esp, %ebp
    
    movl 8(%ebp), %eax
    jmp kraj

main:
    pushl $br_s1
    pushl $s1
    call nesto
    addl $8, %esp

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80