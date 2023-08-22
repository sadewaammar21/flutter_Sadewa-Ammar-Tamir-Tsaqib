var buku = 10000;
var pensil = 5000;
var tas = 100000;
var diskon = 0.1;
int jumlahHargaBarang(buku, pensil, tas) {
  return buku + pensil + tas;
}

double diskonjmlh(buku, pensil, tas, diskon) {
  return (buku + pensil + tas) * diskon;
}

double hargaDiBayar(buku, pensil, tas, diskon) {
  return (buku + pensil + tas) - ((buku + pensil + tas) * diskon);
}

void main() {
  print(jumlahHargaBarang(buku, pensil, tas));
  print(diskonjmlh(buku, pensil, tas, diskon));
  print(hargaDiBayar(buku, pensil, tas, diskon));
}

//1. buatlah  function untuk  menghitung jumlah barang yang  kita  beli  dari sebuah toko
//var buku = 10000;
//var pensil = 5000;
//var tas = 100000;
//2.  hitunglah  diskon 10%  dari  jumlah
//3. hitunglah  harga yang harus di bayar oleh kita

