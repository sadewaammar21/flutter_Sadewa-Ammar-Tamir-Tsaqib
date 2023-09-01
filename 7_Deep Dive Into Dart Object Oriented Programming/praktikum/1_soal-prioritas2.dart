abstract class Matematika {
  double hasil();
}

class KelipatanPersekutuanTerkecil implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerkecil(this.x, this.y);

  @override
  double hasil() {
    int gcd = _findGCD(x, y);
    return (x * y) / gcd.toDouble();
  }

  int _findGCD(int a, int b) {
    if (b == 0) {
      return a;
    }
    return _findGCD(b, a % b);
  }
}

class KelipatanPersekutuanTerbesar implements Matematika {
  int x;
  int y;

  KelipatanPersekutuanTerbesar(this.x, this.y);

  @override
  double hasil() {
    int gcd = _findGCD(x, y);
    return gcd.toDouble();
  }

  int _findGCD(int a, int b) {
    if (b == 0) {
      return a;
    }
    return _findGCD(b, a % b);
  }
}
