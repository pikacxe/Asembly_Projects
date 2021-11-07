.section .data
niz: .long -3,6,7,4,12

.section .text

.globl main

main:
    movl $2, %eax               # indeks u %eax
    movl niz(,%eax,4), %ebx     # 7 u %ebx

    movl $niz, %eax             #adresa niza
    addl $8, %eax               #racunanje adrese elementa
    movl (%eax), %ebx           #7 u %ebx

    movl $niz, %ecx             #adresa niza
    movl $2, %eax               #indeks
    movl (%ecx, %eax, 4), %ebx  # 7 u %ebx


kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80