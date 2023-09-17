# 12_Flutter Form(Form Input Button)

Hari ini paada tanggal 13 September 2023 saya meengikuti live mentoring terkait section 12 dengan materi Flutter Form(Form Input Button)  bersama mentor  kak  Yudha 
materi yang saya terima adalah 
1. form berfungsi untuk menerima isian data dari penguna dan isian data dapat lebih dari satu
form biasanya dibuat menggunakan StatesfulWidget, Keadaan  form disimppan menggunakan GlobalKey<FormState>
2. Input 
- input menggunakan TextField dapat menerima isian data dari pengguna dan isian data dapat lebih dari satu
membuat Text Field data diambil  menggunakan  TextEditingController dan isian data berupa teks
- Radio
Radio berfungsi memberi opsi pada pengguna dan hanya dapat memilih satu opsi 
membuat radio dapat diambil menggunakan property dengan tipe data sesuai value pada radio 
- Chechkbox berfungsi memberi opsi pada pengguna dan dapat dipilih beberapa opsi
membuat Chechkbox data diambil menggunakan property bertipe bool
- Dropdown Button berfungsi memberi opsi pada pengguna, hanya dapat memilih satu opsi, dan opsi tidak ditampilkan di awal, hanya tampil jika di tekan
membuat DropdownButton mengambl data menggunakan property dengan tipe data sesuai value pada DropdownMenuItem
3. Button
Button bersifat seperti tombol dan dapat melakukan sesuatu saat ditekan
- Elevated Button adalah tombol yang timbul dan jika di tekan, akan menjalankan onPressed
- IconButton adalah tombol yang hanya menampilkan icon jika ditekan, akan menjalankan onPressed