.section .data
.section .text
.globl oct_str_to_inter

oct_str_to_inter:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    pushl %esi
    pushl %edi

    movl 8(%ebp), %esi
    movl 8(%ebp), %edi
    movl $0, %eax
    movl $0, %ebx
    movl $8, %ecx


pp_convert:
    movb (%esi), %bl
    andb %bl, %bl
    jz kraj_convert
    subb $'0', %bl
    mull %ecx
    addl %ebx,%eax
    incl %esi
    jmp pp_convert

kraj_convert:
    cmpl %edi, %esi
    jne kraj_pp
i_greska:
    incb 12(%ebp)
kraj_pp:
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret

