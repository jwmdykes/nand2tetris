// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.
@8192
D=A
@n
M=D // n = size of screen

// (LOOP): Main loop
(LOOP)
    @i
    M=0 // i=0
    @fill
    M=0 // fill=0 by default colour screen white

    @KBD
    D=M // store keyboard in D
    @FILL
    D;JEQ // if no key pressed go to fill

    @fill
    M=-1 // else set fill colour to black

    // (FILL): fill screen with value in @fill variable
(FILL)
    @SCREEN
    D=A // D = &SCREEN; D is address of screen buffer
    @i
    A=M+D // A = &SCREEN + i
    D=A
    @screen_idx
    M=D // store screen index at @screen_idx

    @fill
    D=M // D=*fill // D is fill colour
    @screen_idx
    A=M
    M=D // fill screen with value @fill

    @i
    D=M+1
    M=D // ++i;

    @n
    D=M
    @i
    D=D-M // D = n-i
    @LOOP
    D;JEQ // goto LOOP; stop when n=i
    @FILL
    0;JMP // goto FILL;