.section .data                  # sadrzaj u memoriji u bajtovima
bajt:   
    .byte 0xff, 100             #0xff 0x64
rec:    
    .word 0xee56, 2, 50         # 0x56 0xee 0x02 0x00 0x32 0x00
duga_rec:   
    .long 0xabcd1234            # 0x34 0x12 0xcd 0xab

movl duga_rec, %eax              #0xabcd1234 -> eax
movw %ax, rec                   #sadrzaj eax -> rec
movl $bajt, %eax                #adresa labele bajt -> eax
movw bajt, %ax #0x64ff -> ax    #0x64ff -> ax