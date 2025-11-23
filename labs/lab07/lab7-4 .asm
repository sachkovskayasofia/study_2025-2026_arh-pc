%include 'in_out.asm'

SECTION .data
    msg_x: DB 'Введите значение x: ', 0
    msg_a: DB 'Введите значение a: ', 0
    msg_res: DB 'Результат: ', 0

SECTION .bss
    x: RESB 80
    a: RESB 80
    res: RESB 80

SECTION .text
    GLOBAL _start

_start:
    ; Ввод и сохранение x
    mov eax, msg_x
    call sprint
    mov ecx, x
    mov edx, 80
    call sread
    mov eax, x
    call atoi
    mov [x], eax

    ; Ввод и сохранение a
    mov eax, msg_a
    call sprint
    mov ecx, a
    mov edx, 80
    call sread
    mov eax, a
    call atoi
    mov [a], eax

    ; Сравнение x и a
    mov ecx, [x]
    cmp ecx, [a]
    jge greater_equal   ; Если x >= a, переходим на метку greater_equal

    ; --- Ветвь: x < a (Формула: 5x + a) ---
    mov eax, [x]        ; eax = x
    mov ebx, 5
    mul ebx             ; eax = x * 5
    add eax, [a]        ; eax = 5x + a
    mov [res], eax
    jmp print_res       ; Безусловный переход к выводу

greater_equal:
    ; --- Ветвь: x >= a (Формула: 4a - 1) ---
    mov eax, [a]        ; eax = a
    mov ebx, 4
    mul ebx             ; eax = a * 4
    dec eax             ; eax = 4a - 1
    mov [res], eax

print_res:
    ; Вывод результата
    mov eax, msg_res
    call sprint
    mov eax, [res]
    call iprintLF
    call quit