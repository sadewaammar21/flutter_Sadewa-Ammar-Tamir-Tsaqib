#  13_Advance Form Flutter

Hari ini paada tanggal 15 September 2023 saya meengikuti live mentoring terkait section 13 dengan materi Advance Form Flutter  bersama mentor  kak  Yudha, Materi yang saya dapat adalah
 1. Interactive Widgets adalah interaksi antara aplikasi dan user dan mengumpulkan data input dan feedback dari user
2. Date picker 
fungi widget date picker adalah user bisa memasukan tanggal antara lain tanggal kelahiran, waktu pemesanan, waktu reservasi, dll
cara membuat date picker adalah 
- menambahkan packages intl di pubsec.yaml
- mempersiapkan variabel contohnya
*  DateTime -dueDate = DateTime.now();
 * final currentDate = DateTime.now();
- membangun UI atau tampilannya 
- menambahkan fungsi showDatePicker di dalam onPressed
- Memanggil fungsi setState di dalam onPressed
Hasil akhir saat memilih kata yang sudah di onPressed tadi di UI akan tampil sebuah kalender sesuai dengan tanggal yang dipilih
3. color picker 
widget yang berfungsi dimana user bisa memilih color   dan penggunaan color picker bisa digunakan untuk berbagai macam kondisi
cara menambahkan color picker adalah sama seperti membuat date picker  yaitu menambahkan pacakages flutter_colorpicker 
- mempersiapkan variabel
- membuat UI
- menambahkan fungsi showDialog di dalam onPressed dengan return widget AlertDialog 
- import packages  flutter_colorpicker dalam file dart 
-membuat code untuk penggunan packages flutter_colorpicker
- widget ini memliki custom widget yang dapat digunakan seperti BlockPicker, ColorPicker, dan SlidePicker
4. file picker
berfungsi mengakses strorage dan memilih membuka file
cara membuat nya seperti widget tadi
-  menambahkan packages file_pciker dan open_file di pubsec.yaml
- import packages file_picker dan open_file di dalam file dart
- mambangun UI atau tampilan  
- membuat fungsi untuk membuka files yang telah dipilih
- mengammbil file dari objct result dan memanggil fungsi _openFile di dala fungi _pickFile 
- Ketika button dibuka makan akan membuka strorage devies dan file yang akan terbuka