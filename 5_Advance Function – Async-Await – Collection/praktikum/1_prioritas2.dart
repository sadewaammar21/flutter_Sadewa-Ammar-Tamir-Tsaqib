void main() {
  List<List<int>> listOfLists = [
    [1, 10],
    [2, 20],
    [3, 30],
    [4, 40],
    [5, 50],
  ];

  Map<int, int> mapFromList = {};

  for (var subList in listOfLists) {
    if (subList.length == 2) {
      mapFromList[subList[0]] = subList[1];
    }
  }

  print("List of Lists: $listOfLists");
  print("Map from List: $mapFromList");
}
