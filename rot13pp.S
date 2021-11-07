.section .data
.section .text
.globl encode_start


encode_start:
    pushl %ebp
    movl %esi, %ebp
    pushl %esi
    pushl %edi
    pushl %ebx


encode:


encode_end:


    popl %ebp
    ret
