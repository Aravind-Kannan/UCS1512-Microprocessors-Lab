; Move a string without string operations

assume cs:code, ds:data
data segment
    bytes dw 0003H

    src db 01H, 02H, 03H
    dest db 0FFH, 0FFH, 0FFH
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov cx, bytes
        mov si, offset src
        mov di, offset dest
here:
        mov al, [si]
        mov [di], al
        inc si
        inc di
        loop here
        mov ah, 4cH
        int 21H
code ends
end start
