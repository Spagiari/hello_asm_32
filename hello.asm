global start

section .data

msg:    db      "Hello, world!", 10
.len:   equ     $ - msg

section .text
start:
;write
;4   AUE_NULL    ALL { user_ssize_t write(int fd, user_addr_t cbuf, user_size_t nbyte); }
    push    dword msg.len   ;nbyte
    push    dword msg       ;cbuf
    push    dword 1         ;fb (1 - stdout file descriptor)
    mov     eax, 4          ;write
    sub     esp, 4          ;align stack
    int     0x80            ;syscall

;exit
;1    AUE_EXIT    ALL    { void exit(int rval); } 
    push    dword 0         ;rval
    mov     eax, 1          ;exit
    sub     esp, 12         ;align stack
    int     0x80            ;syscall
