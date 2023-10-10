class BookModel {
  int bookId;
  int year;
  String title;
  BookModel({
    required this.bookId,
    required this.title,
    required this.year,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
        bookId: json["book_id"], title: json["title"], year: json["year"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "book_id": bookId,
      "year": year,
      "title": title,
    };
  }
}
