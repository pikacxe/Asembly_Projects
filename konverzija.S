.section .data
    dec_br_max = 10
    dec_br: .fill dec_br_max,1,0
.section .text
.globl main

main:
    movl $375000000, %eax
    leal dec_br, %edi
    movl %10, %ebx
dec_sifra:
    xorl %edx, %edx
    divl %ebx
    addb $'0', %dl 
    movb %dl, (%edi)
    incl %edi
    andl %eax, %eax
    jnz dec_sifra
    movb $0, (%edi)
    decl %edi
    leal dec_br, %esi
obrni:
    cmpl %edi, %esi
    jae kraj
    movb (%esi), %ah
    movb (%edi), %al 
    movb %al, (%esi)
    movb %ah, (%edi)
    decl %edi
    incl %esi
    jmp obrni
kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80
