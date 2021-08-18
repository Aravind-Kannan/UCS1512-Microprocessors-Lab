;Program to multiply two 16-bit numbers

;f209 * 130a = 1200 1F5A

assume cs:code,ds:data
data segment
    multiplicand dw 0f209H
    multiplier dw 130aH
    product_lower dw 0000H
    product_upper dw 0000H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ax, multiplicand
        mov bx, multiplier
        mul bx
        mov product_lower, ax
        mov product_upper, dx
        mov ah, 4cH
        int 21H
code ends
end start