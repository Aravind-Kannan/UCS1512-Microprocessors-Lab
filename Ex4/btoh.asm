; 4a - Program to convert BCD to Hexadecimal

assume cs: code, ds: data
data segment
    source db 12H ; If H is missed the assembler sill take as decimal
    dest db 00H ; 0C
    unpack1 db 00H ; msb
    unpack2 db 00H ; lsb
data ends
code segment
start:  mov ax, data
        mov ds, ax

        ; divide by 10H (16)
        mov al, source
        mov ah, 00H
        mov bl, 10H

        ; ax / bl => quotient = al, remainder = ah
        div bl
        mov unpack1, al ; quotient
        mov unpack2, ah ; remainder

        ; multiply with 0a => ax = al * bl
        mov bl, 0aH
        mul bl
        
        ; move remainder to add with product
        mov ah, unpack2
        add ah, al
        
        ; store final result
        mov dest, ah

        mov ah, 4cH 
        int 21H
code ends
end start 