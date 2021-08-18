;Program to divide two 16-bit numbers

;f209 / 130a = 000c Rem: 0d91

assume cs:code,ds:data
data segment
    dividend dw 0f209H
    divisor dw 130aH
    quotient dw 0000H
    remainder dw 0000H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ax, dividend
        mov dx, 0000H
        mov bx, divisor
        div bx
        mov quotient, ax
        mov remainder, dx
        mov ah, 4cH
        int 21H
code ends
end start