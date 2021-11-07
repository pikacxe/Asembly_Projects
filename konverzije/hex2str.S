.section .data
    broj: .long 12345
    n = 10
    s_broj: .fill n,1,0
.section .text
.globl main


main:
    leal s_broj, %esi
    movl $16, %ecx
    movl broj, %eax
    movb $'0', (%esi)
    incl %esi
    movb $'x', (%esi)
    incl %esi
    movl %esi, %edi
convert:
    xorl %edx, %edx
    andl %eax, %eax
    jz obrni
    divl %ecx
    cmpl $0, %edx
    jl greska
    cmpl $9, %edx
    ja slovo
    addb $'0', %dl
    movb %dl, (%esi)
    incl %esi
    jmp convert

slovo:
    addb $87, %dl
    movb %dl, (%esi)
    incl %esi
    jmp convert

obrni:
    decl %esi
    cmpl %edi,%esi
    jle ispis
    movb (%esi), %bl
    movb (%edi), %al
    movb %al, (%esi)
    movb %bl, (%edi)
    incl %edi
    jmp obrni


ispis:

    movl $4, %eax
    movl $1, %ebx
    leal s_broj, %ecx
    movl $n, %edx
    int $0x80
    jmp kraj

greska:

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80