pada tanggal 2 Oktober 2023 saya meengikuti live mentoring terkait section 21 dengan materi  MVVM Architecture bersama mentor  kak  Yudha 
Materi Yang saya ambil pada live sesion ini adalah
1. MVVM(Model-View ViewModel)
memisahkan logic dengan tampilan (View) kedalam ViewModel
-Keuntungannya
*Reusability : jika ada beberapa masalah yang memerlukan alur logic yang sama. mereka bisa menggunakan ViewModel yang sama
*Maintainability: mudah dirawat karena pekerjaan terkait tampilan tidak tertumpuk bersama logic
*Testability:pengujian menjadi terpisah antara pengujian tampilan dengan pengujian logic sehingga meningkakan produktivitas pada pengujian
2. Struktur direktori
- model meliki 2 bagian yaitu bentuk data yang akan digunakan dan sumber data tersebut
-Tiap Screen diletakkan dalam sebuah direektori yang di dalamnya terdapat View dan ViewModel
3. Model
-Bentuk data yang akan digunakan, dibuat dalam bentuk class
-data-data yang dimuat, diletakkan pada property
4. ViewModel
-Menyimpan data-data dan logic yang diperlukan halaman ContactScreen
-Jika widget lain memerlukan logic yang sama, dapat menggunaan ViewModel ini Juga
5. mendaftarkan ViewModel
-Menggunakkan MultiProvider agar dapat menggunakan banyak ViewModel
-MaterialApp sebgai child utama