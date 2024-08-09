[BITS 16]
[ORG 0x7c00]

start:
    cli ;Clear interrutps
    mov ax, 0x00
    mov ds, ax
    mov es, ax
    mov ss, ax
    mov sp, 0x7c00
    sti ;Enable interrutps
    mov si, msg

print:
    loadsb ; Loads byte at ds:si to AL register and increments SI
    cmp al, 0
    je done
    mov ah, 0x0E
    jmp print

done:
    cli
    hlt ; Stop further execution

msg: db 'Hello world!', 0

times 510 - ($ - $$) db 0

dw 0xAA55 

