import 'package:flutter/material.dart';

class Contact with ChangeNotifier {
  final List<Map<String, String>> _contacts = [];
  List<Map<String, String>> get contacs => _contacts;

  void add(Map<String, String> contact) {
    _contacts.add(contact);
    notifyListeners();
  }

  void edit(int index, Map<String, String> updatedContact) {
    if (index >= 0 && index < _contacts.length) {
      _contacts[index] = updatedContact;
      notifyListeners();
    } else {
      // Handle kesalahan jika indeks tidak valid
      print('Kesalahan: Indeks tidak valid');
    }
  }

  void remove(int index) {
    _contacts.removeAt(index);
    notifyListeners();
  }
}
