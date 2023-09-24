import 'package:aset/halaman_baru.dart';
import 'package:aset/halaman_form.dart';
import 'package:flutter/material.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Utama'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: const Text(
                'Home ',
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) =>
                          HalamanUtama()), // Navigasi ke Halaman Home
                );
              },
            ),
            ListTile(
                onTap: () {
                  Navigator.pop(context); // Tutup drawer
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            HomePage()), // Navigasi ke Halaman Kedua
                  );
                },
                title: const Text('Contact ')),
            ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            HalamanBaru()), // Navigasi ke Halaman Gallery
                  );
                },
                title: const Text('Gallery ')),
          ],
        ),
      ),
      body: Container(
        child: const Center(
          child: Text(
              "Ini Halaman Utama silahkan Pilih halaman lainnya di drawer"),
        ),
      ),
    );
  }
}
