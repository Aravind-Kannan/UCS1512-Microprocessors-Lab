; 5a: Program to add 2 row major matrix

assume cs: code, ds: data

data segment
    row1 db 03H
    col1 db 02H
    row2 db 03H
    col2 db 02H
    org 10H
    mat1 db 00H, 01H, 03H, 05H, 07H, 09H
    org 20H
    mat2 db 02H, 04H, 06H, 08H, 0aH, 0cH
    org 30H
    res db ?
data ends

code segment
start:  mov ax, data
        mov ds, ax

        ; Check row1 == row2 
        mov al, row1
        cmp al, row2
        jne term

        ; Check col1 == col2 
        mov bl, col1
        cmp bl, col2
        jne term

        ; length of row major
        mul bl
        mov cx, ax

        ; ptr to operands and result
        lea si, mat1
        lea di, mat2
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