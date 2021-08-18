; Program to search for byte in a string

assume cs:code, ds:data, es:extra
data segment
    bytes dw 0004H
    key db 01H
    org 0020H
    status dw 0000H
data ends
extra segment
    search_string db 01H, 02H, 03H
extra ends
code segment
start:  mov ax, data
        mov ds, ax
        mov ax, extra
        mov es, ax
        mov cx, bytes
        mov di, offset search_string
        mov al, key
        cld
        repne scasb
        mov status, cx
        mov ah, 4cH
        int 21H
code ends
end start