import 'package:dio/dio.dart';

class BookModel {
  int bookId;
  int year;
  String title;

  BookModel({
    required this.bookId,
    required this.year,
    required this.title,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      bookId: json["book_id"],
      year: json["year"],
      title: json["title"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "book_id": bookId,
      "year": year,
      "title": title,
    };
  }
}

void main() {
  //
  putRequest();
}

// void postContact() async {
//   final dio = Dio();
//   final url = 'https://bookapi-1-v1905306.deta.app/api/v1/books/';

//   final newContact = BookModel(bookId: 2, year: 1990, title: 'Raja Sulaiman');

//   try {
//     final response = await dio.post(
//       url,
//       data: newContact.toJson(),
//     );
//     print('Response status: ${response.statusCode}');
//     print('Response data: ${response.data}');
//   } catch (error) {
//     print('Error: $error');
//   }
// }

void putRequest() async {
  final dio = Dio();
  final url = 'https://jsonplaceholder.typicode.com/posts/1';
  final updatedData = {
    'id': 1,
    'title': 'foo',
    'body': 'bar',
    'userId': 1,
  };

  try {
    final response = await dio.put(
      url,
      data: updatedData,
    );
    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');
  } catch (error) {
    print('Error: $error');
  }
}
