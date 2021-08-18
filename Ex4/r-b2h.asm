assume cs: code, ds: data
data segment
    input db 12H
    output db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov al, input
        and al, 0FH
        mov ch, al

        mov al, input
        and al, 0F0H
        mov cl, 04H
        ror al, cl

        mov bl, 0aH
        mul bl

        add al, ch

        mov output, al

        mov ah, 4cH
        int 21H
code ends
end start