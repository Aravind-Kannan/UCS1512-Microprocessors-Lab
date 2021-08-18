;Program to divide two 8-bit numbers

assume cs:code, ds:data
data segment
    dividend db 05H
    divisor db 03H
    quotient db 00H
    remainder db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ah, 00h
        mov al, dividend
        mov bl, divisor
        div bl
        mov quotient, al
        mov remainder, ah
        mov ah, 4cH
        int 21H
code ends
end start