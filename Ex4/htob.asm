; 4b - Program to convert Hexadecimal to BCD

assume cs: code, ds: data

data segment
    source db 0FFH
    bcd0 db 00H
    bcd1 db 00H
    bcd2 db 00H
data ends

code segment
start:  mov ax, data
        mov ds, ax

        ; divide source by 64H (100)
        mov ah, 00H
        mov al, source
        mov bl, 64H
        div bl
        mov bcd2, al ; quotient
        mov bcd1, ah ; remainder

        ; divide remainder by 0AH (10)
        mov ah, 00H
        mov al, bcd1
        mov bl, 0aH
        div bl
        mov bcd1, al ; quotient
        mov bcd0, ah ; remainder

        ; multiply bcd1 with 10H (16)
        mov bl, 10H
        mul bl

        ; add bcd0 with bcd1
        mov bl, bcd0
        add al, bl

        mov bcd1, al ;destination

        mov ah, 4cH
        int 21H
code ends
end start
