.section .data
    dec_br: .ascii "3133734892\0"
    greska: .byte 0
.section .text
.globl main

main:
    leal dec_br, %esi
    movb $0, greska
    xorl %eax, %eax
    xorl %ebx, %ebx
    movl $10, %ecx
dec_cifra:
    movb (%esi), %bl
    andb %bl, %bl
    jz kraj_dec
    subb $'0', %bl
    mull %ecx
    addl %ebx,%eax
    incl %esi
    jmp dec_cifra
kraj_dec:
    cmpl $dec_br, %esi
    jne kraj
i_greska:
    incb greska
kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80

