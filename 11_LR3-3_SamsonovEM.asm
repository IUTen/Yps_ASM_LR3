use16
org 0x100

mov bx, 0x6e; Начальный адрес памяти

main:
    mov cx,16; Пробегаем по строкам
    row_run:
        push cx

        mov cx,16; Пробегаем по столбцам
        column_run:
            mov al, byte[0x0+bx] ;записали значение из памяти для вывода
            call print_al
            inc bx; сделали шаг для номера ячейки в памяти
            call make_space
            loop column_run
        
        call make_endl

        pop cx
        loop row_run

    ;Завершение программы
    mov ax, 0
    int 20h

;Вывод пробела в консоль
make_space:
    pusha
    mov ah, 0x2
    mov dl, 0x20
    int 21h
    popa
    ret

;Переход на новую строку
make_endl:
    pusha
    mov ah, 0x9
    mov dx, new_line
    int 21h
    popa
    ret

;Печать символа ASCII. В DL должен находиться код символа
print_one:
    pusha
    mov ah, 0x02
    int 21h
    popa
    ret

print_al:
    pusha
    
    mov cx, 1
    push ax; Сохранили значение на будущее

    shr al, 4; Сдвигаем, чтобы осталась первая цифра
    and al, 0xf; Оставляем нужную тетру
    cmp ax, 0x9; Проверяем, число или буква
    ja symbol_wrd; Если цифра больше 9, это буква
    jmp symbol_figure; Если цифра не больше 9, это цифра

    back_get:;Проверяем, делали ли мы второй блок
    cmp cx, 0
    je back_get_2
    sub cx, 1;Учёт выполнения второго блока

    pop ax; Вернули значение на вывод

    and al, 0xf; Оставляем нужную тетру
    cmp ax, 0x9; Проверяем, число или буква
    ja symbol_wrd; Если цифра больше 9, это буква
    jmp symbol_figure; Если цифра не больше 9, это цифра
    back_get_2:

    popa
    ret

symbol_wrd:
    mov dl, al;Запись значения
    add dl, 0x37; Смещение по коду ASCII, чтобы получить нужный символ
    call print_one
    jmp back_get
symbol_figure:
    mov dl, al;Запись значения
    add dl, 0x30; Смещение по коду ASCII, чтобы получит нужный символ
    call print_one
    jmp back_get

new_line:
    db 0xD, 0xA, '$'