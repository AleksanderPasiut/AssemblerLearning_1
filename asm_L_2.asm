P0 EQU 080H
P1 EQU 090H
P2 EQU 0A0H
P3 EQU 0B0H

org 0
ljmp start

org 100h
start:          mov P0,#0x1

init_delay:     mov R0, #0x16   ; X parameter
loop_delay_0:   mov R1, #0x2a   ; Y parameter
loop_delay_1:   mov R2, #0x86   ; Z parameter
loop_delay_2:   dec R2
                mov A,R2
                jnz loop_delay_2
                dec R1
                mov A,R1
                jnz loop_delay_1
                dec R0
                mov A,R0
                jnz loop_delay_0
                mov A,P0
                rl A
                mov P0,A
                jmp init_delay

end
