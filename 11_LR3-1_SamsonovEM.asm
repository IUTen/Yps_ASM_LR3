use16
org 0x100

main:
    mov di, 0xd; Строка вывода
    mov si, 0x02; Столбец вывода

    mov dh, 0x1f; Атрибуты вывода
    mov dl, 0x54; ASCII символ

    call printx

    mov ax, 0x0
    int 16h
    int 20h


printx:
	pusha

	;Настройка памяти видеоадаптера
	push dx
	mov ax,0xb800
	mov es,ax

	;подсчёт строк
	mov ax,0x00a0	;80*2=160(10)=a0(16)
	dec di
	mul di
	mov di,ax

	;Подсчёт столбцов
	mov ax,0x2
	mul si
	mov si,ax
	
	add di,si
	
	pop si
	
	mov word[es:di], si

	popa
	ret




