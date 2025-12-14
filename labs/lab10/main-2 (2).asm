%include 'in_out.asm'

SECTION .data
    filename db 'name.txt', 0h
    msg_prompt db 'Как Вас зовут?', 0h
    msg_prefix db 'Меня зовут ', 0h
    len_prefix equ $ - msg_prefix

SECTION .bss
    contents resb 255

SECTION .text
    global _start
_start:
    mov eax, msg_prompt
    call sprint

    mov ecx, contents
    mov edx, 255
    call sread

    mov ecx, 0666o
    mov ebx, filename
    mov eax, 8
    int 80h
    
    mov esi, eax

    mov edx, len_prefix
    mov ecx, msg_prefix
    mov ebx, esi
    mov eax, 4
    int 80h

    mov eax, contents
    call slen
    
    mov edx, eax
    mov ecx, contents
    mov ebx, esi
    mov eax, 4
    int 80h

    mov ebx, esi
    mov eax, 6
    int 80h

    call quit