import 'dart:io';
void main(){
  stdout.write("Masukan sebuah Angka yang ingin di faktorkan");
  int? angka = int.parse(stdin.readLineSync()!);
  print("Faktor dari angka tersebut adalah $angka");

  for (int i =1; i<= angka; i++){
    if (angka % 1==0){
      print(i);
    }
  }
}