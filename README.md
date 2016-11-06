# AssemblerLearning
Very simple .asm programs for Intel 8051.

Program 1

Program implements diode blinking. Diode has to be attached to specified bit of first port (P0). Which bit is that is specified by A parameter. Times of diode on and diode off are both equal T = 8 + X * (5 + Y * (5 + 4 * Z))  cycles, where X, Y, Z are values from 1 to 255. In my case, where X = 255, Y = 255, Z = 3, T = 1 106 708 cycles, which is 1.106708 s for 12 MHz clock signal.


Program 2

Program implements switching on and off diodes attached to all 8 bits of first port (P0). Diodes are being turned on and off one after another. Each diode is active exactly 0.5 second (provided that clock signal is 12 MHz).

Program 3

Upgraded version of program 1. Program features delay in separate subprogram and interruptions enabling and handling.

Program 4

Upgraded version of program 1. Program uses timers in order to create delay.
