.section .data
.section .text
.globl  inter_to_oct_str_float

inter_to_oct_str_float:
    pushl %ebp
    movl %esp, %ebp
    subl %8, %esp
    pushl %ebx
    pushl %esi
    pushl %edi
    movl 8(%ebp), %eax
    movl 12(%ebp), %edi
    movl $8 , %ebx
    movl $100000000, -8(%ebp)
    andl %eax, %eax
    jns i2o_nula
    movb $'-',(%edi)
    incl %edi
    decl 16(%ebp)
    negl %eax
i2o_nula:
    cmpl $4, 16(%ebp)
    jl i2o_greska
    movb $'0', (%edi)
    movb $'.', 1(%edi)
    addl $2, %edi
    decl 16(%ebp)
i2o_cifra:
    decl 16(%ebp)
    cmpl $1, 16(%ebp)
    je i2o_term
    mull %ebx
    divl -8(%ebp)
    addb $'0', %al 
    movb %al, (%edi)
    incl %edi
    movl %edx, %eax
    andl %eax, %eax
    jnz i2o_cifra
i2o_term:
    movb $0, (%edi)
    jmp i2o_kraj
i2o_greska:
    incl -4(%ebp)
i2o_kraj:
    movl -4(%ebp), %eax
    popl %edi
    popl %esi
    popl %ebx
    movl %ebp, %esi
    popl %ebp
    ret