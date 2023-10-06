pada tanggal 4 Oktober 2023 saya meengikuti live mentoring terkait section 20 dengan materi Introduction REST API – JSON serialization/deserialization bersama mentor  kak  Yudha 
Materi Yang saya ambil pada live sesion ini adalah
1. Rest API (Representational State Transfer Application Programming Interface)
-Arsitektural yang memisahkan tampilan dengan proses bisnis
-Bagian tampilan dengan proses bisnis berkirim data melalui HTTP Request
2. HTTP
-Protokol yang digunakan untuk berkirim data pada internet, biasanya data tersebut berbentuk media web
-Pola Komunikasi
* Client mengirim request
* Server mengolah dan membalas dengan memberi response
3. Struktur Request 
-URL/Alamat halaman yang di akses
- Method(GET, POST, PUT, DELETE)
-Header
*informasi tambahan terkait request yang dikirimkan
-Body
*Data yang disertakan berama request
4. Struktur Response
-Status Code
*Kode yang memiliki keseluruhan response, baik sukses maupun gagal
- Header 
*Informasi tambahan terkait response yang diberikan
-Body
* Data yag disertakan bersama response
4.Dio
-Dio Flutter adalah pustaka klien HTTP sumber terbuka , ringan , dan fleksibel untuk Dart dan Flutter.
5. serialisasi JSON
-mengubah Struktur data kebentuk JSON
* Map/List -> Serialisasi-> JSON
6. Deserialisasi JSON
- beda dengan serialisasi JSON untuk Deserialisasi mengubah bentuk JSON ke struktur data
* JSON -> Deserialisasi -> Map/List
- Menggunakan fungsi jsonDecode dari package dart:convert 
7. membuat aplikasi sederhana  yang berkaitan tentanng res API