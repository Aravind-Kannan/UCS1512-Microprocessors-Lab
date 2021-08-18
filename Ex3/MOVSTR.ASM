; Program to move strings

assume cs:code, ds:data, es:extra
data segment
    words dw 0003H 
    src_string db 01H, 02H, 03H
data ends
extra segment
    dest_string db 00H, 00H, 00H
extra ends
code segment
start:  mov ax, data
        mov ds, ax
        mov ax, extra
        mov es, ax
        mov cx, words
        mov si, offset src_string
        mov di, offset dest_string
        cld ; DF = 0 => Auto increment index registers
        rep movsb ; if CX!= 0: instruction, CX--, repeat
        mov ah, 4cH 
        int 21H
code ends
end start