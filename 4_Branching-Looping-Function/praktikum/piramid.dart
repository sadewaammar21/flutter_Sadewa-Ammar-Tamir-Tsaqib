import 'dart:io';

void main() {
  int tinggi = 8; // Tinggi piramida

  for (int i = 1; i <= tinggi; i++) {
    for (int j = 1; j <= tinggi - i; j++) {
      stdout.write(" ");
    }
    for (int k = 1; k <= 1 * i - 1; k++) {
      stdout.write("* ");
    }

    stdout.write("\n"); // Pindah ke baris berikutnya
  }
}
