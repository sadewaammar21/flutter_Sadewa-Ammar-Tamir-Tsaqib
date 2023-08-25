import 'dart:io';

void main() {
  print("Masukkan sebuah bilangan: ");
  int number = int.parse(stdin.readLineSync()!);

  if (isPrime(number)) {
    print("$number adalah bilangan prima.");
  } else {
    print("$number bukan bilangan prima.");
  }
}

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  }

  if (number <= 3) {
    return true;
  }

  if (number % 2 == 0 || number % 3 == 0) {
    return false;
  }

  int i = 5;
  while (i * i <= number) {
    if (number % i == 0 || number % (i + 2) == 0) {
      return false;
    }
    i += 6;
  }

  return true;
}
