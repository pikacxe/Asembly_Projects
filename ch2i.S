.section .data
    poruka1: .ascii "Unesite string za prevodjenje:\n\0"
    br_por1 = . - poruka1
    str_max = 30
    s1: .fill str_max,1,42
    greska: .long 0
    br_s1: .long 0


.section .text
.globl main


main:

    # Ispis poruke
    movl $4, %eax
    movl $1, %ebx
    leal poruka1, %ecx
    movl $br_por1, %edx
    int $0x80

    # Unos stringa za konverziju
    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $str_max, %edx
    int $0x80

    movl %eax, br_s1

    pushl $greska
    pushl $s1
    call pp_start
    addl $8, %esp

    # Ispis stringa
    movl $4, %eax
    movl $1, %ebx
    leal s1, %ecx
    movl br_s1, %edx
    int $0x80



exit:
    movl $1, %eax
    movl $0, %ebx
    int $0x80