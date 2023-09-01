class BangunRuang {
  double panjang;
  double lebar;
  double tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  double volume() {
    return 0; // Override oleh subclass
  }
}

class Sisi {
  double sisi;

  Sisi(this.sisi);
}

class Kubus extends BangunRuang {
  Kubus(double sisi) : super(sisi, sisi, sisi);

  @override
  double volume() {
    return panjang * panjang * panjang;
  }
}

class Balok extends BangunRuang {
  Sisi sisi;

  Balok(double panjang, double lebar, double tinggi, this.sisi)
      : super(panjang, lebar, tinggi);

  @override
  double volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  Kubus kubus = Kubus(5.0);
  Balok balok = Balok(4.0, 3.0, 2.0, Sisi(2.0));

  BangunRuang bangun1 = kubus;
  BangunRuang bangun2 = balok;

  print('Volume Kubus: ${bangun1.volume()}');
  print('Volume Balok: ${bangun2.volume()}');
}
