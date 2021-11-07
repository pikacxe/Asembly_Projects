.section .data
    str_max = 50
    poruka: .ascii "Unesite zeljeni string: \0"
    br_poruka = . - poruka
    poruka_kraj: .ascii "Broj unetih znakova je: \n\0"
    br_poruka_kraj = . - poruka_kraj

    s1: .fill str_max, 1, 42
    br_znak: .long 0

.section .text
.globl main


main:

    #Ispis poruke
    
    movl $4, %eax
    movl $1, %ebx
    leal poruka,%ecx
    movl $br_poruka, %edx
    int $0x80

    # Unos strniga 
    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $str_max, %edx
    int $0x80
    movl %ecx, %esi
    addl %eax, %ecx
    decl %ecx

broji_znakove:
    cmpl %ecx, %esi
    je kraj
    cmpb $'?', (%esi)
    je broji 
    incl %esi
    jmp broji_znakove

broji:
    incl br_znak
    incl %esi
    jmp broji_znakove



kraj:
    #Ispis zavrsne poruke
    
    movl $4, %eax
    movl $1, %ebx
    leal poruka_kraj,%ecx
    movl $br_poruka_kraj, %edx
    int $0x80

    # Povratna vrednost i kraj programa
    movl $1,%eax
    movl br_znak, %ebx
    int $0x80