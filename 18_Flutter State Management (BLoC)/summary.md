pada tanggal 27 September 2023 saya meengikuti live mentoring terkait section 18 dengan materi Flutter State Management (BLoC) bersama mentor  kak  Yudha 
Materi yang dapat saya ambil adalah
1. Declarative UI 
- Fluttter memeiliki sifat declarative yang artinya flutter membangun UI nya pada screen yntuk mencerminkaan keadaan state saat ini
2. Satet
- state adalah ketika sebuah widget sedang aktif dan widget tersebut menyimpan data di memori
- flutter akan membangun uang UI nya ketika ada state atau data yang berubah
- ada 2 jenis state dalam flutter, empheral state dan app state
3. Empheral state
- Digunakan ketika tidak ada bagian lain pada widget tree yang membutuhkan untuk mengases data widget nya contohnya:
* PageView
*BootomNavigatorBar
*SwitchButton
-Tidak perlu State management yang kompleks
-Hanya membutuhkan  StatefulWidget dengan menggunakan fungi setState()
4. Apptate
-digunakan ketika bagian yang lain suatu aplikasi membutuhkan akses data state widget, contohnya
*Login info
*pengaturan prefensi pengguna
*keranjang belanja
5. BLoC 
-BLoC(Business Logic Component)
-memisahkan antara business logic dengan UI
- Cara kerja BLoC
* Menerima event sebagai input
*Dianalisa dan dikelola di dalam BLoC
*Mengasilkan state sebagai output
- stream
* Rangkaian proses secara asynchronous
*Actor utama di dalam BLoC