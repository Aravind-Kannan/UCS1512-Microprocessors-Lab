; Move a string without string operations

assume cs: code, ds: data, es: extra
data segment
    count dw 0003H
    src db 0FFH, 0FEH, 0FDH
data ends
extra segment
    dest db 00H, 00H, 00H
extra ends
code segment
start:  mov ax, data
        mov ds, ax
        mov ax, extra
        mov es, ax
        mov cx, count       ; Data in memory (var) => mov cx, var        == mov cx, [location of var]  
        mov si, offset src  ; Address in mem (var) => mov si, offset var == mov cx, location of var
        mov di, offset dest
here:   
        mov ax, [si]        ; Data in reg (var)    => mov ax, [si]        == mov cx, [location of var]  
        mov es:[di], ax
        inc si
        inc di
        loop here
        mov ah, 4cH
        int 21H
code ends
end start