import 'dart:math';

void main() {
  List<int> values = [7, 5, 3, 5, 2, 1];
  int Ratarata = calculateRoundedAverage(values);
  print("Hasil Rata-ratanya adalah $Ratarata");
}

int calculateRoundedAverage(List<int> values) {
  if (values.isEmpty) {
    return 0;
  }

  int dt = 0;
  for (var value in values) {
    dt += value;
  }

  double ratarata = dt / values.length;
  return ratarata.ceil();
}
