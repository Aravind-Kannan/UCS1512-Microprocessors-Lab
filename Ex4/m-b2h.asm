; Prac - 4a: bcd2hex Mathematically

assume cs: code, ds: data
data segment
    input db 12H
    output db 00H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ah, 00H
        mov al, input
        mov bl, 10H
        div bl
        mov cl, ah
        
        mov bl, 0aH
        mul bl

        add al, cl
        
        mov output, al

        mov ah, 4cH
        int 21H
code ends
end start