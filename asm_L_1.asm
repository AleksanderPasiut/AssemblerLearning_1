P0 EQU 080H
P1 EQU 090H
P2 EQU 0A0H
P3 EQU 0B0H

org 0
ljmp start

org 100h
start:

switch_on:
mov P0, #0x1
jmp init_delay_0

switch_off:
mov P0, #0x0

    init_delay_0:
    mov R0, #0xff ;--------------- X parameter
    loop_delay_0:

        init_delay_1:
        mov R1, #0xff ;----------- Y parameter
        loop_delay_1:

            init_delay_2:
            mov R2, #0x3 ;-------- Z parameter
            loop_delay_2:

            dec R2
            mov A,R2
            jnz loop_delay_2

        dec R1
        mov A,R1
        jnz loop_delay_1

    dec R0
    mov A,R0
    jnz loop_delay_0

mov A,P0
jnz switch_off
jmp switch_on

end
