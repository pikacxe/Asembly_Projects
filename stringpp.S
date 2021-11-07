#Potprogram koji broji koliko puta se zadati znak ponavlja u stringu
.section .data
.section .text
.globl broji_string_start


broji_string_start:
    pushl %ebp
    movl %esp, %ebp
    pushl %ebx
    movl 8(%ebp),%edx
    movl 12(%ebp), %ebx 
    movl $0, %eax
    addl %edx, %ebx

broji_string:
    cmpl %ebx, %edx
    je broji_string_kraj
    movb (%edx), %cl
    cmpb $' ', %cl
    je postoji_znak
    incl %edx
    jmp broji_string

postoji_znak:
    incl %eax
    incl %edx
    jmp broji_string

broji_string_kraj:
    popl %ebx
    movl %ebp, %esp
    popl %ebp
    ret