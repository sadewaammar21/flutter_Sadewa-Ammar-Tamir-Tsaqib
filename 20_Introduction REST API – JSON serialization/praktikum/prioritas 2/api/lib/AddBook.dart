import 'package:api/models/block_models.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class AddBookForm extends StatefulWidget {
  final Function(BookModel) onBookAdded;

  AddBookForm({required this.onBookAdded});

  @override
  _AddBookFormState createState() => _AddBookFormState();
}

class _AddBookFormState extends State<AddBookForm> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    yearController.dispose();
    super.dispose();
  }

  void _addBook() {
    var data = {
      "title": titleController.text,
      "year": int.tryParse(yearController.text) ?? 0,
    };

    Dio()
        .post("https://bookapi-1-v1905306.deta.app/api/v1/books/",
            data: jsonEncode(data))
        .then((response) {
      var responseDetail = response.data["detail"];
      if (responseDetail["status_code"] == 201) {
        widget.onBookAdded(BookModel.fromJson(response.data["data"]));
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Data Berhasil Ditambahkan"),
          ),
        );
        Navigator.pop(context); // Tutup dialog
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("Data Gagal Ditambahkan"),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: titleController,
          decoration: const InputDecoration(
            labelText: "Title",
          ),
        ),
        TextField(
          controller: yearController,
          decoration: const InputDecoration(
            labelText: "Year",
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Tutup dialog
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: _addBook,
              child: const Text("Save"),
            ),
          ],
        ),
      ],
    );
  }
}
