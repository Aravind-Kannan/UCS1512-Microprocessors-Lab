;Program to subtract two 16-bit numbers

;f209 - 130a = deff sign: 00
;130a - f209 = deff sign: 01

assume cs:code,ds:data
data segment
    minuend dw 0f209H
    subtrahend dw 130aH
    diff dw 0000H
    sign db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ax, minuend
        mov bx, subtrahend
        mov ch, 00H
        sub ax, bx
        jnc noCarry
        inc ch
        neg ax
noCarry:mov diff, ax
        mov sign, ch
        mov ah, 4cH
        int 21H
code ends
end start