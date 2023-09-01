import 'mobil.dart';
import 'hewan.dart';

void main(List<String> args) {
  Mobil mobil = Mobil(50.0); // Kapasitas maksimum muatan mobil

  Hewan kucing = Hewan(4.5);
  Hewan anjing = Hewan(15.2);

  mobil.tambahMuatan(kucing);
  mobil.tambahMuatan(anjing);

  print('Total muatan mobil: ${mobil.totalMuatan()} kg');
}
