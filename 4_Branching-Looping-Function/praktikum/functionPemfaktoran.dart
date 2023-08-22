BigInt faktor(int n) {
  if (n == 0 || n == 1) {
    return BigInt.one;
  } else {
    return BigInt.from(n) * faktor(n - 1);
  }
}

void main() {
  List<int> values = [10, 40, 50];

  for (int value in values) {
    BigInt result = faktor(value);
    print("Faktorial dari $value adalah $result");
  }
}
