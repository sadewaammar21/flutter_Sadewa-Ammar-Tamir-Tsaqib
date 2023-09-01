class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return panjang * lebar * tinggi;
  }
}

class Sisi {
  double sisi;

  Sisi(this.sisi);
}

class Kubus extends BangunRuang {
  Kubus(double sisi) : super(sisi, sisi, sisi);
}

class Balok extends BangunRuang {
  Sisi sisi;

  Balok(double panjang, double lebar, double tinggi, this.sisi)
      : super(panjang, lebar, tinggi);
}
