class Course {
  String title;
  String description;

  Course(this.title, this.description);
}

class Student {
  String name;
  String className;
  List<Course> courses = [];

  Student(this.name, this.className);

  // Method untuk menambahkan course ke daftar
  void tambahCourse(Course course) {
    courses.add(course);
  }

  // Method untuk menghapus course dari daftar
  void hapusCourse(Course course) {
    courses.remove(course);
  }

  // Method untuk melihat semua course yang dimiliki
  void lihatCourses() {
    if (courses.isEmpty) {
      print('$name tidak memiliki course.');
    } else {
      print('$name memiliki course berikut:');
      for (var course in courses) {
        print('Title: ${course.title}, Deskripsi: ${course.description}');
      }
    }
  }
}

void main() {
  // Contoh penggunaan class Course dan Student
  Course course1 = Course('IPA', 'Pengenalan Fungsi Fungi dan Bakteri');
  Course course2 = Course('Kimia', 'Pembelajaran Tentang reaksi Reduksi');

  Student student1 = Student('Rio', 'XIIC');
  Student student2 = Student('Hendi', 'XIID');

  student1.tambahCourse(course1);
  student1.tambahCourse(course2);

  student2.tambahCourse(course1);

  print('Courses milik Rio:');
  student1.lihatCourses();

  print('\nCourses milik Hendi:');
  student2.lihatCourses();

  student1.hapusCourse(course2);

  print('\nSetelah menghapus course Kimia dari Rio:');
  student1.lihatCourses();
}
