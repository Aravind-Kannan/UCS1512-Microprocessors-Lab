;Program to add two 16-bit numbers

;f209 + 130a = 1 0513

assume cs:code,ds:data
data segment
    augend dw 0f209H
    addend dw 130aH
    sum dw 0000H
    carry db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ax, augend
        mov bx, addend
        mov ch, 00H
        add ax, bx
        jnc noCarry
        inc ch
noCarry:mov sum, ax
        mov carry, ch
        mov ah, 4cH
        int 21H
code ends
end start