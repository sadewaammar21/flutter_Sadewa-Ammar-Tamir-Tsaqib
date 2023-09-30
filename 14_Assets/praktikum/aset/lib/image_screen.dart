import 'package:aset/halaman_baru.dart';
import 'package:aset/halaman_image.dart';
import 'package:aset/prov_Page/provider_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageModel = Provider.of<ImageModel>(context); //provider
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back), // Ikon kembali (back)
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => HalamanBaru()),
            ); // Kode untuk kembali ke halaman sebelumnya
          },
        ),
        title: Text('Galeri Gambar'),
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0, // Jarak antar gambar secara horizontal
          mainAxisSpacing: 10.0, // Jumlah kolom dalam grid
        ),

        itemCount: 4, // Jumlah gambar yang ingin ditampilkan
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              imageModel.selectImage(index);
              _showImageDialog(
                  context, index); // Tampilkan bottom sheet saat gambar di-tap
            },
            child: Image.asset('assets/background.jpg'),
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, int index) {
    final imageModel = Provider.of<ImageModel>(context);
    showModalBottomSheet<void>(
      backgroundColor: Colors.amber,
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Image.asset('assets/background.jpg'),
            const Text("Apakah ingin melihat lebih detail?"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    // Aksi saat tombol "Ya" dipilih
                    imageModel.selectImage(index); //provider
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              HalamanImage()), // Navigasi ke Halaman Gallery
                    ); // Tutup bottom sheet
                    // Tambahkan aksi lain yang sesuai di sini
                  },
                  child: const Text('Ya'),
                ),
                FloatingActionButton(
                  onPressed: () {
                    // Aksi saat tombol "Tidak" dipilih
                    Navigator.pop(context); // Tutup bottom sheet
                    // Tambahkan aksi lain yang sesuai di sini
                  },
                  child: Text('Tidak'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
