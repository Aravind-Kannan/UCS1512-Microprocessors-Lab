;Program to multiply two 8-bit numbers

assume cs: code, ds: data
data segment 
    multiplicand db 10H
    multiplier db 10H 
    prod dw 0000H
data ends
code segment
        org 50H
start:  mov ax, data
        mov ds, ax

        mov al, multiplicand
        mov bl, multiplier
        mul bl
        mov prod, ax
        mov ah, 4cH
        int 21H
code ends
end start