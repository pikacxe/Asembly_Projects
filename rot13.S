.section .data
    str_max = 50
    p1: .ascii "Unesite string: \0"
    br_p1 = . - p1

    p2: .ascii "Enkodovan string: \0"
    br_p2 = . - p2

    s1: .fill str_max, 1, 42
    br_s1: .long 0

.section .text
.globl main


main:
    #Ispis prve poruke

    movl $4, %eax
    movl $1, %ebx
    leal p1, %ecx
    movl $br_p1, %edx
    int $0x80

    #Unos stringa

    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $str_max, %edx
    int $0x80
    addl %eax, br_s1
    movl $s1, %esi       #Pocetak stringa
    movl $s1, %edi 
    addl %eax, %edi     #Kraj stringa

encode:
    cmpl %esi, %edi
    je kraj
    cmpb $'A', (%esi)
    jl uvecaj
    cmpb $'Z', (%esi)
    ja znak
    jle provera_veliko

provera_malo:
    cmpb $'n', (%esi)
    jge oduzmi
    jb dodaj

provera_veliko:
    cmpb $'N', (%esi)
    jge oduzmi
    jb dodaj

oduzmi:
    subl $13, (%esi)
    incl %esi
    jmp encode

dodaj:
    addl $13, (%esi)
    incl %esi
    jmp encode

znak:
    cmpb $'a', (%esi)
    jl uvecaj
    cmpb $'z', (%esi)
    ja uvecaj
    jmp provera_malo

uvecaj:
    incl %esi
    jmp encode


kraj:
    #Ispis druge poruke

    movl $4, %eax
    movl $1, %ebx
    leal p2, %ecx
    movl $br_p2, %edx
    int $0x80

    #Ispis rezultujuceg stringa

    movl $4, %eax
    movl $1, %ebx
    leal s1, %ecx
    movl br_s1, %edx
    int $0x80


    movl $1, %eax
    movl $0, %ebx
    int $0x80