import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MaterialApp'),
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(title: Text('Home')),
            ListTile(title: Text('Settings')),
          ],
        ),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'L', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Leanne Graham',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '1-770-736-8031 x56442',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'E', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Ervin Howell',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '010-692-6593 x09125',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'C', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Clementine Bauch',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '1-463-123-4447',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'P', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Patricia Lebsack',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '493-170-9263x156',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'C', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Chelsey Dietrich',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '(254)954-1289',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'M', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Mrs. Dennis Schulist',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '1-477-935-8478 x6430',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                'K', // Inisial huruf kontak
                style: TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              'Kurtis Weissnat',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '210.067.6132',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
