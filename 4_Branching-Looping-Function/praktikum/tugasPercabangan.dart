import 'dart:io';

String getGrade(int nilai) {
  if (nilai > 70) {
    return "A";
  } else if (nilai > 40) {
    return "B";
  } else if (nilai > 0) {
    return "C";
  } else {
    return "";
  }
}

void main() {
  stdout.write("Masukan Nilai Anda : ");
  int nilaiSiswa = int.parse(stdin.readLineSync()!);

  String hasilNilai = getGrade(nilaiSiswa);
  print("Hasil Grade Nilai adalah $hasilNilai");
}
