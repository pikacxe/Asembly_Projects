#Ilija Spasic PR-34/2020

.section .data
    str_max = 20               
    s1_unos: .ascii "Unesite prvi string"   
    s2_unos: .ascii "Unesite drugi string"   
    
    s1: .fill str_max, 1, 42
    s2: .fill str_max, 1, 42
    br_s1 = . - s1_unos
    br_s2 = . - s2_unos
    r: .long 0

    br_plus: .long 0
    br_minus: .long 0
.section .text
.globl main


main:
    # Stampanje poruke za unos prvog stringa
    movl $4, %eax
    movl $1, %ebx
    leal s1_unos, %ecx
    movl $br_s1, %edx
    int $0x80


    # Unos prvog stringa

    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $str_max, %edx
    int $0x80

    # Stampanje poruke za unos drugog stringa
    movl $4, %eax
    movl $1, %ebx
    leal s2_unos, %ecx
    movl $br_s2, %edx
    int $0x80

    # Unos drugog stringa

    movl $3, %eax
    movl $0, %ebx
    leal s2, %ecx
    movl $str_max, %edx
    int $0x80    

    #Prebroj s1
    movl $s1, %esi

s1_broji:
    cmpl $s1+str_max, %esi
    jne broji_plus
    je s2_broji

broji_plus:
    cmpb $'+', (%esi)
    je ima_plus
    jmp loop
ima_plus:
    incl br_plus

loop:
    incl %esi
    jmp s1_broji

s2_broji



kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80