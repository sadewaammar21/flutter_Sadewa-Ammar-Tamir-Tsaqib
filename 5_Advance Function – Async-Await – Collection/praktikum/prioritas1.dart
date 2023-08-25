Future<List<int>> multiplyListAsync(List<int> data, int pengali) async {
  List<int> result = [];

  await Future.forEach(data, (int value) async {
    int hasilPengali = value * pengali;
    result.add(hasilPengali);
  });

  return result;
}

void main() async {
  List<int> inputData = [1, 2, 3, 4, 5];
  int pengali = 2;

  List<int> multipliedData = await multiplyListAsync(inputData, pengali);
  print("Input data: $inputData");
  print("Multiplied data: $multipliedData");
}
