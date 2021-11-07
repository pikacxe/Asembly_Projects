.section .data
.section .text
.globl pp_start


pp_start:
    pushl %ebp
    movl %esp, %ebp
    pushl %edi
    pushl %ebx


    movl 8(%ebp), %edi
    movl $10, %ecx
    movl $0, %eax
    movl $0, 12(%ebp)
pp_do:
    cmpb $',', (%edi)
    je pp_kraj
    movb (%edi), %bl
    andb %bl, %bl
    jz pp_kraj
    subb $'0', %bl
    mull %ecx
    addl %ebx, %eax
    incl %edi
    incl 12(%ebp)
    jmp pp_do
pp_kraj:
    incl 12(%ebp)
    popl %ebx
    popl %edi
    movl %ebp, %esp
    popl %ebp
    ret