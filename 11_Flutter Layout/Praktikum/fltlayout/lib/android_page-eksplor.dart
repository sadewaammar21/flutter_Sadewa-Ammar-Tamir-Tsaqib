import 'package:flutter/material.dart';

class HomeEksplor extends StatelessWidget {
  const HomeEksplor();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Flutter App"),
        centerTitle: true,
        backgroundColor: Color(0xFF6200EE),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              // Tidak ada logika pencarian yang diimplementasikan di sini
              showSearch(context: context, delegate: null!);
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text("Learn Flutter"),
          ),
          ListTile(
            title: Text("Learn ReactJS"),
          ),
          ListTile(
            title: Text("Learn VueJS"),
          ),
          ListTile(
            title: Text("Learn Tailwind CSS"),
          ),
          ListTile(
            title: Text("Learn UI/UX"),
          ),
          ListTile(
            title: Text("Learn Figma"),
          ),
          ListTile(
            title: Text("Learn Digitan Marketing"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Tindakan yang akan diambil saat tombol "+" ditekan
          print(null);
        },
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,

      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.error_outline), label: 'Information'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        backgroundColor: Color(0xFF6200EE),
      ), // Tempatkan di pojok kanan bawa
    );
  }
}
