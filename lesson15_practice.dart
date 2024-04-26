import 'dart:io';
import 'dart:math';

void main() {
  // print('Давайте решим пример!');
  // task1();

  // print('Салеметсизби это Кости ');
  // task2();

  // task3();

  // task4();

  print(fib(21));
}

// 1) Создать функцию, которая запрашивает у пользователя ответ на пример a
// + b = ?
// Нужно создать две переменные a и b, которые генерируются с помощью
// рандома.
// Также нужна переменная которая записывает результат(сложение
// переменных a и b).
// Затем вы вводите ответ с клавиатуры.
// Компьютер сравнивает ответы.
// Если вы ответили правильно, то вывести на экран «Правильно!».
// Если вы ответили неправильно, то заново вызвать функцию.

// // 2) Создать функцию, которая бросает игральную кость(нарды).
// Затем вы вводите ответ с клавиатуры: 1- бросить еще раз, 2 - закончить.
// Если вы введете 1, то функция вызывается заново,
// Если вы введете 2, то вывести на экран «wasted»

// 3) Создать функцию, которая возводит введенное вами число в введенную
// вами степенью,
// т.е. Ваша функция принимает два параметра a и b.

//4) Дано натуральное число N. Вычислите сумму его цифр.

void task1() {
  Random random = Random();
  int a = random.nextInt(100);
  int b = random.nextInt(100);
  int correctAnswer = a + b;

  stdout.write('$a + $b = ?\nВведите ваш ответ: ');
  int userAnswer = int.parse(stdin.readLineSync()!);

  if (userAnswer == correctAnswer) {
    print('Правильно!');
  } else {
    print('Неправильно! Попробуйте еще раз.');
    task1();
  }
}

void task2() {
  Random random = Random();
  int diceResult = random.nextInt(8) + 1;

  print('Вы бросили кость и выпало: $diceResult');

  stdout.write('Хотите бросить еще раз? (1 - да, 2 - нет): ');
  int choice = int.parse(stdin.readLineSync()!);

  if (choice == 1) {
    task2();
  } else if (choice == 2) {
    print('wasted');
  } else {
    print('Некорректный выбор. Попробуйте еще раз.');
    task2();
  }
}

task3() {
  int power(int base, int exponent) {
    return base == 0 && exponent == 0
        ? throw ArgumentError('0 в степени 0 не определено')
        : base == 0
            ? 0
            : exponent == 0
                ? 1
                : base == 1
                    ? 1
                    : exponent == 1
                        ? base
                        : base * power(base, exponent - 1);
  }

  stdout.write('Введите число: ');
  int a = int.parse(stdin.readLineSync()!);

  stdout.write('Введите степень: ');
  int b = int.parse(stdin.readLineSync()!);

  int result = power(a, b);

  print('$a в степени $b равно $result');
}

task4() {
  int sumOfDigits(int n) {
    int sum = 0;

    while (n > 0) {
      sum += n % 10;
      n ~/= 10;
    }
    return sum;
  }

  int n = 123;
  int result = sumOfDigits(n);
  print('Сумма цифр числа $n равна $result');
}

int fib(int n) {
  if (n <= 1) {
    return n;
  } else {
    int a = 0;
    int b = 1;

    for (int i = 2; i <= n; i++) {
      int temp = a + b;
      a = b;
      b = temp;
    }
    return b;
  }
}
