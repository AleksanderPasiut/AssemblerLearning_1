P0 EQU 080H
P1 EQU 090H
P2 EQU 0A0H
P3 EQU 0B0H

org 0x0
ljmp start

org 0x3         ; INT0
                mov P1, #0x1
                reti

org 0xb         ; T0

org 0x13        ; INT1
                mov P2, #0x1
                reti

org 0x1b        ; T1

org 100h
start:          mov P0,#0xfe
                mov 0xa8,#10000101b ; enable INT0 and INT1

loop:           acall delay
                
                ;mov P1, #0x1
                mov A,P0
                rl A                
                mov P0,A
                ljmp loop

delay:          mov R0, #0x05   ; X parameter
loop_delay_0:   mov R1, #0x63   ; Y parameter
loop_delay_1:   mov R2, #0xfb   ; Z parameter
loop_delay_2:   djnz R2, loop_delay_2
                djnz R1, loop_delay_1
                djnz R0, loop_delay_0
                ret
end
