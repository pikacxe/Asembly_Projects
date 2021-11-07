.section .data
.section .text
.globl pp_start


pp_start:
    pushl %ebp
    movl %esp, %ebp
    pushl %esi
    pushl %ebx

    movl 8(%ebp), %esi
    movl $10, %ecx
    movl $0, %eax

convert_to_internal:
    movb (%esi), %bl
    cmpb $10, (%esi)
    je convert_kraj
    subb $'0', %bl
    mull %ecx
    addl %ebx, %eax
    incl %esi
    jmp convert_to_internal

convert_kraj:
    movb (%esi), %bl
    cmpb 8(%ebp), %bl
    jne pp_kraj
i_greska:
    incb 12(%ebp)

pp_kraj:
    popl %ebx
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret