.section .data
    str_max = 30
    p1: .ascii "Unesite prvi string: \0"
    br_p1 = . - p1
    p2: .ascii "Unesite drugi string: \0"
    br_p2 = . - p2

    s1: .fill str_max, 1, 48
    s2: .fill str_max, 1,48
    br_s1: .long 0
    br_s2: .long 0
.section .text
.globl main

pp_start:
    pushl %ebp
    movl %esp, %ebp
    push %esi
    push %edi

    movl 8(%ebp), %edi
    movl 12(%ebp), %esi

pp_do:
    cmpb $10, (%esi)
    je pp_end

s2_for:
    movb (%esi), %al
    cmpb %al, (%edi)
    je provera
    cmpb $10, (%edi)
    je next_ch
    jmp next

provera:
    cmpb $'A', (%esi)
    jl next
    cmpb $'Z', (%esi)
    jl veliko
    cmpb $'a', (%esi)    
    jl next
    cmpb $'z', (%esi)
    jl malo

next:
    incl %edi
    jmp s2_for

malo:
    subl $32, (%edi)
    jmp next

veliko:
    addl $32, (%edi)

pp_end:
    popl %edi
    popl %esi
    movl %ebp, %esp
    popl %ebp
    ret

next_ch:
    incl %esi
    movl 8(%ebp), %edi
    jmp pp_do

main:

    #Ispis prve poruke
    movl $4, %eax
    movl $1, %ebx
    leal p1, %ecx
    movl $br_p1, %edx
    int $0x80

    #Unos prvog stringa
    movl $3, %eax
    movl $0, %ebx
    leal s1, %ecx
    movl $str_max, %edx
    int $0x80

    movl %eax, br_s1
    
    #Ispis druge poruke
    movl $4, %eax
    movl $1, %ebx
    leal p2, %ecx
    movl $br_p2, %edx
    int $0x80

    #Unos drugog stringa
    movl $3, %eax
    movl $0, %ebx
    leal s2, %ecx
    movl $str_max, %edx
    int $0x80

    movl %eax, br_s2

    pushl $s1
    pushl $s2
    call pp_start
    addl $8, %esi

kraj:

    #Ispisi rezultat
    movl $4, %eax
    movl $1, %ebx
    leal s2, %ecx
    movl br_s2, %edx
    int $0x80

    movl $1, %eax
    movl $0, %ebx
    int $0x80