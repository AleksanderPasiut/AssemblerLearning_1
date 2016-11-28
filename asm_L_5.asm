; P0.0 - segment A
; P0.1 - segment B
; P0.2 - segment C
; P0.3 - segment D
; P0.4 - segment E
; P0.5 - segment F
; P0.6 - segment G
; P0.7 - segment DP

; P1.0 - display 0
; P1.1 - display 1
; P1.2 - display 2
; P1.3 - display 3

org 0
    ljmp start
org 03h
    ljmp increment
org 0bh
    ljmp timer
org 100h
start:
    mov 0x89,#00100001b ; set T0 in mode 1 (16-bit counter)
    mov 0x88,#00010001b ; enable T0 counter auto-incrementation and set INT0 to falling-edge
    mov 0xa8,#10000011b ; enable T0 and INT0 interruption

    mov A,#00000100b ; init A counter

    mov DPTR, #tab ; set data pointer

    mov R0,#1 ; init registers
    mov R1,#2
    mov R2,#3
    mov R3,#4
    
idle:     ; main idle loop
    ljmp idle

increment:  ; INT0
    inc R0
    inc R1
    inc R2
    inc R3
    reti

timer:      ; T0
    mov tl0, #0
    mov th0, #0fbh
    
    mov P1,A
    
    cjne A,#00000001b, assign_1
    push A
    mov A,R0
    movc A,@a+dptr
    mov P0,A
    pop A
    ljmp assign_4
assign_1:
    mov A,P1
    cjne A,#00000010b, assign_2
    push A
    mov A,R1
    movc A,@a+dptr
    mov P0,A
    pop A
    ljmp assign_4
assign_2:
    mov A,P1
    cjne A,#00000100b, assign_3
    push A
    mov A,R2
    movc A,@a+dptr
    mov P0,A
    pop A
    ljmp assign_4
assign_3:
    push A
    mov A,R3
    movc A,@a+dptr
    mov P0,A
    pop A
assign_4:

    mov A,P1
    
    rr A
    jnz timer_no_inc
    mov A,#00000100b
timer_no_inc:
    reti

tab:
db 11000000b
db 11111001b
db 10100100b
db 10110000b
db 10011001b
db 10010010b
db 10000010b
db 11111000b
db 10000000b
db 10010000b

end
    
