import 'hewan.dart';

void main(List<String> args) {
  Hewan kucing = Hewan(4.5);
  Hewan anjing = Hewan(15.2);

  print('Berat kucing: ${kucing.berat} kg');
  print('Berat anjing: ${anjing.berat} kg');
}
