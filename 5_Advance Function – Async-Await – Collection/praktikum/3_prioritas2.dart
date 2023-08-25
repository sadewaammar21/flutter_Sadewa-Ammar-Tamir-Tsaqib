import 'dart:async';

void main() async {
  int inputAngka = 5;
  int factor = await calculateFactorial(inputAngka);
  print("Factorial dari angka $inputAngka adalah  $factor");
}

Future<int> calculateFactorial(int n) async {
  if (n == 0 || n == 1) {
    return 1;
  }

  int result = 1;

  await Future.forEach(
    List.generate(n, (index) => index + 1),
    (int value) async {
      result *= value;
    },
  );

  return result;
}
