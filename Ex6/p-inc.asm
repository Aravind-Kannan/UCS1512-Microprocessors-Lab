; 6a: Sorting in ascending order

assume cs: code, ds: data
data segment
    count db 03H
    arr db 75H, 33H, 01H, 25H
data ends
code segment
start:  mov ax, data
        mov ds, ax

        mov ch, 00H
        mov cl, count

outer:  mov dx, cx
        mov si, offset arr          
        mov di, offset arr + 1

inner:  mov al, [si]
        cmp al, [di]
        
        ; si < di => CF = 1, already in place
        jc skip

        xchg al, [di]
        mov [si], al 

skip:   inc si
        inc di

        dec dx
        jnz inner

        loop outer

        mov ah, 4cH
        int 21H
code ends
end start
