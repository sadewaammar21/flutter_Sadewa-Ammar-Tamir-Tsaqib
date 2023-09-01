import '1_soal-prioritas2.dart';

void main() {
  Matematika operation = KelipatanPersekutuanTerkecil(12, 18);
  print('Kelipatan Persekutuan Terkecil: ${operation.hasil()}');

  operation = KelipatanPersekutuanTerbesar(12, 18);
  print('Kelipatan Persekutuan Terbesar: ${operation.hasil()}');
}
