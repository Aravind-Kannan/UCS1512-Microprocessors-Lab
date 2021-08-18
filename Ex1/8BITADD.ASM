;Program to add two 8-bit numbers

assume cs:code, ds:data
data segment
    addend db 0f0H
    augend db 1fH
    sum db 00H
    carry db 00H
data ends 
code segment
        org 100H
start:  mov ax, data
        mov ds, ax

        mov ah, addend
        mov bh, augend
        mov ch, 00H
        add ah, bh
        jnc noCarry
        inc ch
noCarry:mov sum, ah
        mov carry, ch
        mov ah, 4cH
        int 21H
code ends
end start
