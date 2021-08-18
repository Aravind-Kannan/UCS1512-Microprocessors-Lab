; Prac - 4b: hex2bcd Mathematically

assume cs: code, ds: data
data segment
    input db 0FFH
    msb db 00H
    lsb db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ah, 00H
        mov al, input
        mov bl, 64H
        div bl

        mov msb, al

        mov al, ah
        mov ah, 00H
        mov bl, 0aH
        div bl

        mov cl, 04h
        rol al, cl

        add al, ah

        mov lsb, al 

        mov ah, 4cH
        int 21H
code ends
end start