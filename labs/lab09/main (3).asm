%include 'in_out.asm'

SECTION .data
msg: DB 'Введите x: ', 0
res_msg: DB 'f(x) = (x+1)*7. Результат: ', 0

SECTION .bss
x: RESB 80
res: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi       
    
    call _calc_func 
    
    mov [res], eax  
    
    mov eax, res_msg
    call sprint
    mov eax, [res]
    call iprintLF
    call quit

_calc_func:
    add eax, 1   
    mov ebx, 7   
    mul ebx      
    
    ret