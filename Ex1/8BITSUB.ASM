;Program to subtract two 8-bit numbers

assume cs:code, ds:data
data segment
    minuend db 0ffH
    subtrahend db 0feH
    diff db 00H
    sign db 00H
data ends
code segment
        org 50H
start:  mov ax, data
        mov ds, ax

        mov ah, minuend
        mov bh, subtrahend
        mov ch, 00H
        sub ah, bh
        jnc trueForm
        inc ch
        neg ah
trueForm:
        mov diff, ah
        mov sign, ch
        mov ah, 4cH
        int 21H
code ends
end start