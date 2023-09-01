import 'kalkulator.dart';
import 'dart:io';

void main() {
  kalkulator calc = kalkulator();

  stdout.write('Masukkan bilangan pertama: ');
  double bil1 = double.parse(stdin.readLineSync()!);

  stdout.write('Masukkan bilangan kedua: ');
  double bil2 = double.parse(stdin.readLineSync()!);

  // Contoh penggunaan metode-metode Calculator
  print('Penjumlahan: ${calc.penjumlahan(bil1, bil2)}');
  print('Pengurangan: ${calc.pengurangan(bil1, bil2)}');
  print('Perkalian: ${calc.perkalian(bil1, bil2)}');
  try {
    print('Pembagian: ${calc.pembagian(bil1, bil2)}');
  } catch (e) {
    print('Error: $e');
  }
}
