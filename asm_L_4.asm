P0 EQU 080H
P1 EQU 090H
P2 EQU 0A0H
P3 EQU 0B0H

TH0 EQU 08CH
TL0 EQU 08AH
TH1 EQU 08DH
TL1 EQU 08BH

org 0           
                ljmp start

org 0bh         
                ljmp timer_0    ; T0
                             
org 100h
start:          mov 0x89,#00100001b ; set T0 in mode 1 (16-bit counter)
                mov 0x88,#00010000b ; enable T0 counter auto-incrementation
                mov 0xa8,#10000010b ; enable T0 counter interruption
                
                mov A,#10    ; init A counter
                
idle:           jnz idle
                
                mov A,P0
                jz diodes_off
diodes_on:      mov P0,#0                    
                jmp diodes_set
diodes_off:     mov P0,#0xff
diodes_set:     mov A,#10    ; update A counter
                
                ljmp idle

timer_0:        mov TL0,#0xb7    ; setting timer 0 to 50 000 cycles 
                mov TH0,#0x3c    ; value set to counter = 65536 - (50000 - 7)
                dec A
                nop
                reti
end
