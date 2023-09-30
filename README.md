<p align="center">
      <img src="https://i.ibb.co/VgqLdNG/lr-logo.png" width="726">
</p>

<p align="center">
   <img alt="Static Badge" src="https://img.shields.io/badge/Asm-FASM-blue?label=Asm&labelColor=%231303fc&color=%23ffffff">
</p>

## About

Лабораторная работа состоит из 3-х частей.

### Часть 1.
**-** **`Задание:`** Разработать подпрограмму вывода одного символа в произвольную часть экрана, со следующими входными параметрами

**-** **`Краткое объяснение:`** В части *"main"* задаём сдвиги для строки и столбцов. Также настраиваем регистр *DX*, чтобы вывести определенный символ. После вызываем функцию по печати символа.
Рассмотрим функцию печати. Настраиваем память для видеоадаптера, после просчитываем все сдвиги для нашего символа. В итоге записываем в память символ.


### Часть 2.
**-** **`Задание:`** Разработать программу, которая выводит значения регистров общего назначения

**-** **`Пример вывода:`**
AX=ba12
BX=de34
CX=34ef
...

**-** **`Краткое объяснение:`** Для начала нам необходимо сохранить все РОНы(Регистры Общего Назначения) в стек. Далее для каждого РОНа используем функцию вывода.

Функция вывода: В цикле использовать функцию вывода символа

Функция вывода символа: Смещаем значение регистра вправо, чтобы нужный оказался справа. С помощью маски и команды *AND* оставляем одну "цифру". Далее занимаемся выводом этого символа

### Часть 3.
**-** **`Задание:`** Разработать программу, которая выводит на экран дамп памяти 256 байт, 16 на одну строку

**-** **`Пример вывода:`**

20 78 6f .. .. 4e 6a

bc f5 bb .. .. 1e aa

.. .. .. .. .. .. ..

00 00 08 00 00 f5 aa


**-** **`Краткое объяснение:`** Задаём начальный адрес памяти опираясь на свой порядковый номер в группе. Далее пробегаем по строкам и столбцам используя функцию вывода.

Функция вывода: Функцию делаем аналогично как во второй части, только количество "цифр" для вывода =2. В моём случае я происзводил запись на вывод в регистр *AX*


## Developers

- [Ypsilon](https://github.com/YpsilonXX)

## License
MIT License