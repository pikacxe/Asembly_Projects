.section .data
    broj: .long 12345
    s_broj: .fill 5,1,42
.section .text
.globl main


main:
    movl broj, %eax
    movl $8, %ecx
    leal s_broj, %esi
    leal s_broj, %edi
convert:
    xorl %edx, %edx
    andl %eax, %eax
    jz obrni
    divl %ecx
    addb $'0', %dl 
    movb %dl, (%esi)
    incl %esi
    jmp convert
obrni:
    cmpl %edi,%esi
    jle ispis
    movb (%esi), %bl
    movb (%edi), %al
    movb %al, (%esi)
    movb %bl, (%edi)
    incl %edi
    decl %esi
    jmp obrni

ispis:
    movl $4, %eax
    movl $1, %ebx
    leal s_broj, %ecx
    movl $6, %edx
    int $0x80

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80