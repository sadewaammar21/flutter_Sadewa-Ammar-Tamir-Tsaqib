import 'package:aset/Home_Page.dart';
import 'package:aset/halaman_form.dart';
import 'package:aset/image_screen.dart';
import 'package:flutter/material.dart';

class HalamanBaru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Halaman Awal Galleri',
            style: TextStyle(fontSize: 20),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (context) =>
                            HalamanUtama()), // Navigasi ke Halaman Home
                  );
                },
                title: const Text(
                  'Home ',
                ),
              ),
              ListTile(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage()), // Navigasi ke Halaman Form
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
                title: const Text(
                  'Gallery ',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
        body: Align(
          alignment: Alignment.topCenter,
          child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.white)),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => ImageScreen()),
                );
              },
              child: const Text(
                "Halaman Gallery",
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  fontSize: 30,
                  color: Colors.amber,
                ),
              )),
        ));
  }
}
