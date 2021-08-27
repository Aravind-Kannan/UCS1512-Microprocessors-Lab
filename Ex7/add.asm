; 7a - BCD Addtion

assume cs: code, ds: data
data segment
    augend db 99H
    addend db 99H
    carry db 00H
    sum db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov al, augend
        add al, addend
        daa

        mov sum, al

        jnc term
        mov carry, 01H

term:   mov ah, 4cH
        int 21H
code ends
end start
