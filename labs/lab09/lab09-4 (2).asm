%include 'in_out.asm'

SECTION .data
div: DB 'Результат: ', 0

SECTION .text
GLOBAL _start ; Обязательное объявление глобальной точки входа

_start:         ; <-- Метка начала выполнения программы
    ; Вычисление выражения (3+2)*4+5 = 25
    mov ebx, 3
    mov eax, 2
    add ebx, eax    ; EBX = 5
    
    mov eax, ebx    ; ИСПРАВЛЕНИЕ: Перенос 5 в EAX для MUL
    
    mov ecx, 4
    mul ecx         ; EAX = 5 * 4 = 20
    
    add eax, 5      ; EAX = 20 + 5 = 25
    
    mov edi, eax    ; Сохраняем результат в EDI

    ; Вывод результата
    mov eax, div
    call sprint
    mov eax, edi
    call iprintLF
    
    call quit