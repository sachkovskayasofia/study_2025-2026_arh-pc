%include 'in_out.asm'

SECTION .data
    msgA db 'Введите число A: ', 0
    msgB db 'Введите число B: ', 0
    msgC db 'Введите число C: ', 0
    msgRes db "Наименьшее число: ", 0

SECTION .bss
    A resb 10
    B resb 10
    C resb 10
    min resb 10

SECTION .text
    GLOBAL _start

_start:
    ; Ввод и сохранение A
    mov eax, msgA
    call sprint
    mov ecx, A
    mov edx, 10
    call sread
    mov eax, A
    call atoi
    mov [A], eax

    ; Ввод и сохранение B
    mov eax, msgB
    call sprint
    mov ecx, B
    mov edx, 10
    call sread
    mov eax, B
    call atoi
    mov [B], eax

    ; Ввод и сохранение C
    mov eax, msgC
    call sprint
    mov ecx, C
    mov edx, 10
    call sread
    mov eax, C
    call atoi
    mov [C], eax

    ; Логика поиска минимума
    
    ; 1. Присваиваем min = A
    mov ecx, [A]
    mov [min], ecx

    ; 2. Сравниваем min (A) и C. Используем jl (Jump if Less)
    cmp ecx, [C]
    jl check_B          ; Если A < C, A остается минимумом, переходим к проверке B
    
    ; Иначе (C <= A): min = C
    mov ecx, [C]
    mov [min], ecx

check_B:
    ; 3. Сравниваем текущий min и B
    mov ecx, [min]
    cmp ecx, [B]
    jl fin              ; Если min < B, то минимум найден, переходим на выход
    
    ; Иначе (B <= min): min = B
    mov ecx, [B]
    mov [min], ecx

fin:
    ; Вывод результата
    mov eax, msgRes
    call sprint
    mov eax, [min]
    call iprintLF
    call quit