; Program to compare two strings

assume cs:code, ds:data, es:extra
data segment
; To differentiate 01H to last byte and 00H to equal strings
; Else, both will produce 00H
    bytes dw 0004H 
    src_string db 01H, 02H, 03H
    org 0020H
    status dw 0000H
data ends
extra segment
    dest_string db 01H, 02H, 04H
extra ends
code segment
start:  mov ax, data
        mov ds, ax
        mov ax, extra
        mov es, ax
        mov cx, bytes
        mov si, offset src_string
        mov di, offset dest_string
        cld ; DF = 0 => Auto increment index registers
        repe cmpsb ; if CX!= 0: instruction, CX--, if ZF = 1 repeat
        mov status, cx
        mov ah, 4cH 
        int 21H
code ends
end start