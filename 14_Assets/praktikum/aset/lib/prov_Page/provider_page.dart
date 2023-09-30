import 'package:flutter/foundation.dart';

class ImageModel extends ChangeNotifier {
  int _selectedIndex = -1; // Indeks gambar yang dipilih

  int get selectedIndex => _selectedIndex;

  void selectImage(int index) {
    _selectedIndex = index;
    notifyListeners(); // Memberi tahu listener bahwa state telah berubah
  }
}
