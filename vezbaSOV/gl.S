.section .data
    p1: .ascii "Unesite izraz:"
    p1_br = . - p1
    greska1: .ascii "GRESKA: Prekoracenje prilikom racunanja sume"
    greska1_br = . - greska1
    greska2: .ascii "GRESKA: Problem prilikom konverzije"

    ispis2: .ascii "Suma brojeva u opsegu je manja.\n\0"
    ispis2_br = . - ispis2
    ispis3: .ascii "Suma brojeva van opsega je manja.\n\0"
    ispis3_br = . - ispis3
    ispis4: .ascii "Sume su jednake.\n\0"
    ispis4_br = . - ispis4
    str_max = 100
    s1: .fill str_max,1,42
    br_s1: .long 0
    g_granica: .long 0
    d_granica: .long 0

    niz: .fill 10,4,0
    temp: .long 0
.section .text
.globl main


main:
    # Ispis prve poruke
    movl $4, %eax
    movl $1, %ebx
    leal p1, %ecx
    movl $p1_br, %edx
    int $0x80

    # Unos izraza
    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $str_max, %edx
    int $0x80

    # Broj unesenih karaktera
    movl %eax, br_s1
    movl $s1, %esi
    incl %esi
opseg:

    # Donja granica
    pushl temp
    pushl %esi
    call pp_start
    movl %eax, d_granica
    addl $4, %esp
    popl temp
    addl temp, %esi

    # Gornja granica
    pushl temp
    pushl %esi
    call pp_start
    movl %eax, g_granica
    addl $4, %esp
    popl temp
    addl temp, %esi

    movl $niz, %edi
niz_start:
    cmpb $'{', (%esi)
    je pocetak_niza
    incl %esi
    jmp niz_start
pocetak_niza:
    incl %esi
dodaj_niz:
    cmpb $'}', (%esi)
    je racunaj_start
    pushl temp
    pushl %esi
    call pp_start
    movl %eax, (%edi)
    addl $4, %esp
    popl temp
    addl temp, %esi
    incl %edi
    jmp dodaj_niz

racunaj_start:
    movl $0, %eax
    movl $0, %ebx

racunaj:
    cmpl $niz, %edi
    je poruka_kraj
    movl (%edi), %ecx
    cmpl d_granica,%ecx
    jae gornja_granica

van_opseg_saberi:
    addl (%edi), %ebx
    decl %edi
    jmp racunaj

gornja_granica:
    cmpl g_granica, %ecx
    ja van_opseg_saberi

opseg_saberi:
    addl (%edi), %eax
    decl %edi
    jmp racunaj

poruka_kraj:
    cmpl %ebx, %eax
    je isti
    jb opseg_manji


opseg_veci:
    # Ispis prve poruke
    movl $4, %eax
    movl $1, %ebx
    leal ispis3, %ecx
    movl $ispis3_br, %edx
    int $0x80


opseg_manji:
    # Ispis prve poruke
    movl $4, %eax
    movl $1, %ebx
    leal ispis2, %ecx
    movl $ispis2_br, %edx
    int $0x80

isti:
    # Ispis prve poruke
    movl $4, %eax
    movl $1, %ebx
    leal ispis4, %ecx
    movl $ispis4_br, %edx
    int $0x80

kraj:
    movl $1, %eax
    movl $0, %ebx
    int $0x80