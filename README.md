# AssemblerLearning_1
very simple .asm program for Intel 8051

Program implements diode blinking. Diode has to be attached to specified bit of first port (P0). Which bit is that is specified by A parameter. Times of diode on and diode off are both equal T = 8 + X * (5 + Y * (5 + 4 * Z))  cycles, where X, Y, Z are values from 1 to 255. In my case, where X = 255, Y = 255, Z = 3, T = 1 106 708 cycles, which is 1.106708 s for 12 MHz clock signal.
