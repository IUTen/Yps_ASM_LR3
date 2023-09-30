use16
org 0x100

main:
    mov ax, 0xf9a8; Тестовое значение
    mov bx, 0xad21; Тестовое значение

    ;Сохранение РОНов в стек
    pushf
    push bp
    push sp
    push di
    push si
    push es
    push ds
    push ss
    push cs
    push dx
    push cx
    push bx
    push ax

    mov ah, 0x9; Вектор для вывода строки
    mov dx, ax_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, bx_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, cx_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, dx_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, cs_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, ss_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, ds_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, es_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, si_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, di_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, sp_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, bp_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ah, 0x9; Вектор для вывода строки
    mov dx, flags_name; Строка для вывода
    int 21h; Прерывание на вывод
    pop ax
    call print_info

    mov ax, 0x0
    int 20h

print_info:
    mov cx, 4
    pusha; Сохранение данных перед выполнением процедуры
    l:
        call get_letter; Печать символа
        loop l

    popa
    ret

get_letter:
;AX и СХ уже считается заданными. AX-что нужно вывести, CX-Сколько символов осталось
    pusha; Сохранение данный перед выполнением процедуры

    push cx; Сохранили оставшееся количество символов на вывод
    sub cx,1; Вычли единицу, чтобы не выйти за границу
    cmp cx,0
    je nul
    left_:
        shr ax, 4; Смещение значения вправо
        loop left_
    nul:
    pop cx; Восстановили оставшееся количество символов на вывод

    and ax, 0xf; Обнулили все тетры, кроме нужной
    cmp ax, 0x9; Проверяем, число или буква
    ja symbol_wrd; Если цифра больше 9, это буква
    jmp symbol_figure; Если цифра не больше 9, это цифра
    back_get:


    popa; Возврат данных после выполнения процедуры
    ret

ax_name:
    db "AX= $"
bx_name:
    db 0xD, 0xA,"BX= $"
cx_name:
    db 0xD, 0xA,"CX= $"
dx_name:
    db 0xD, 0xA,"DX= $"
cs_name:
    db 0xD, 0xA,"CS= $"
ss_name:
    db 0xD, 0xA,"SS= $"
ds_name:
    db 0xD, 0xA,"DS= $"
es_name:
    db 0xD, 0xA,"ES= $"
si_name:
    db 0xD, 0xA,"SI= $"
di_name:
    db 0xD, 0xA,"DI= $"
sp_name:
    db 0xD, 0xA,"SP= $"
bp_name:
    db 0xD, 0xA,"BP= $"
flags_name:
    db 0xD, 0xA,"FLAGS= $"


symbol_wrd:
    pusha
    mov dl, al
    add dl, 0x37; Смещение по коду ASCII, чтобы получить нужный символ
    mov ah, 0x2; Инструкция для вывода символа
    int 21h; Прерывание на вывод
    popa
    jmp back_get
symbol_figure:
    pusha
    mov dl, al
    add dl, 0x30; Смещение по коду ASCII, чтобы получит нужный символ
    mov ah, 0x2; Инструкция для вывода символа
    int 21h; Прерывание на вывод
    popa
    jmp back_get