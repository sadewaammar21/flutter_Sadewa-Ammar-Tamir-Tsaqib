import 'dart:io';

void main() {
  int size = 9;
  printMultiplicationTable(size);
}

void printMultiplicationTable(int size) {
  for (int i = 1; i <= size; i++) {
    for (int j = 1; j <= size; j++) {
      int result = i * j;
      stdout.write("$result\t");
    }
    print(""); // Pindah baris setelah setiap baris tabel
  }
}
