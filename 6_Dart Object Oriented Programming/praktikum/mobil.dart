import 'hewan.dart';

class Mobil {
  double kapasitas;
  List<Hewan> muatan = [];

  Mobil(this.kapasitas);

  double totalMuatan() {
    double total = 0;
    for (var hewan in muatan) {
      total += hewan.berat;
    }
    return total;
  }

  void tambahMuatan(Hewan hewan) {
    if (totalMuatan() + hewan.berat <= kapasitas) {
      muatan.add(hewan);
      print(
          'Hewan dengan berat ${hewan.berat} kg ditambahkan ke dalam muatan.');
    } else {
      print(
          'Kapasitas muatan tidak mencukupi untuk menambahkan hewan dengan berat ${hewan.berat} kg.');
    }
  }
}
