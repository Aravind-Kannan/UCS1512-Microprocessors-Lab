; 7b - BCD subtraction

assume cs: code, ds: data
data segment
    minuend db 38H
    subtrahend db 61H
    sign db 00H
    diff db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov al, minuend
        sub al, subtrahend
        das

        jnc term
        mov sign, 01H

        mov bl, 99H
        sub bl, al
        inc bl
        mov al, bl
        daa

term:   mov diff, al

        mov ah,4cH
        int 21H
code ends
end start