import 'dart:io';

void main() {
  int tinggi = 5;

  for (int i = 1; i <= tinggi; i++) {
    for (int j = 1; j < i; j++) {
      stdout.write(" ");
    }

    for (int k = 1; k <= 1 * (tinggi - i) + 1; k++) {
      stdout.write("0 ");
    }

    stdout.write("\n");
  }

  for (int i = tinggi - 1; i >= 1; i--) {
    for (int j = 1; j < i; j++) {
      stdout.write(" ");
    }

    for (int k = 1; k <= 1 * (tinggi - i) + 1; k++) {
      stdout.write("0 ");
    }

    stdout.write("\n");
  }
}
