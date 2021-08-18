; Program to practice

assume cs: code, ds: data

data segment
    row1 db 02H
    col1 db 04H
    row2 db 02H
    col2 db 04H
    org 10H
    mat1 db 01H, 03H, 05H, 07H, 09H, 0bH, 0dH, 0fH
    org 20H
    mat2 db 00H, 02H, 04H, 06H, 08H, 0aH, 0cH, 0eH
    org 30H
    res db ?
data ends

code segment
start:  mov ax, data
        mov ds, ax

        mov al, row1
        cmp al, row2
        jne term
        mov bl, col1
        cmp bl, col2
        jne term

        mul bl
        mov cl, al

        mov si, offset mat1
        mov di, offset mat2
        mov bx, offset res

iter:   mov al, [si] 
        add al, [di]
        mov [bx], al

        inc si
        inc di
        inc bx

        loop iter

term:   mov ah, 4cH
        int 21H

code ends
end start