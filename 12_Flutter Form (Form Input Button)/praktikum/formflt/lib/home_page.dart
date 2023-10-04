import 'package:flutter/material.dart';
import 'package:formflt/components/profile_sheet.dart';
import './contact.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  List<Contact> contacts = List.empty(growable: true);

  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    context: context,
                    builder: (context) {
                      return const ProfilSheet();
                    });
              },
              icon: const Icon(Icons.account_circle))
        ],
      ),
      body: Center(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 10.0),

                const Icon(
                  Icons.mobile_friendly,
                  size: 24,
                  color: Colors.black,
                ),
                const SizedBox(
                  height: 8.0,
                ),
                const Text(
                  "Create New Contacts",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                    height:
                        8.0), // Jarak antara teks "Create New Contacts" dan deskripsi
                const Text(
                  "A dialog is a type of modal window that appears in",
                  style: TextStyle(
                    fontSize: 14.0, // Ukuran huruf kecil
                  ),
                ),
                const Text(
                  "front of app content to provide critical information, or",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const Text(
                  "prompt for a decision to be made",
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                TextFormField(
                    controller: nameController,
                    decoration: const InputDecoration(
                      labelText: 'name',
                      hintText: 'Insert Your Name',
                      filled: true,
                      fillColor: Color.fromARGB(255, 244, 188, 246),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'nama harus disii';
                      }

                      List<String> nameParts = value.split('');
                      if (nameParts.length < 2) {
                        return 'Nama Harus terdiri 2 kata';
                      }
                      for (String part in nameParts) {
                        if (part[0] != part[0].toUpperCase()) {
                          return 'Diawali kapital';
                        }
                        if (value.contains(RegExp(
                            r'[0-9!@#$%^&*()_+={}\[\]:;"<>,.?/~`|\\]'))) {
                          return 'Nama tidak boleh mengandung angka atau karakter khusus.';
                        }
                        return null;
                      }
                    }),
                SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: contactController,
                  maxLength: 15,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Nomor',
                    hintText: '+62...',
                    filled: true,
                    fillColor: Color.fromARGB(255, 244, 188, 246),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor telepon harus diisi.';
                    }

                    if (!RegExp(r'^0\d{7,14}$').hasMatch(value)) {
                      return 'Nomor telepon tidak valid. Pastikan dimulai dengan angka 0, terdiri dari 8-15 digit, dan hanya berisi angka.';
                    }

                    return null; // Validasi berhasil
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          String name = nameController.text.trim();
                          String contact = contactController.text.trim();
                          print(
                              "Nama Pemilik $name, Contact Pemillik $contact");
                          if (name.isNotEmpty && contact.isNotEmpty) {
                            setState(() {
                              nameController.text = '';
                              contactController.text = '';
                              contacts
                                  .add(Contact(name: name, contact: contact));
                            });
                          }
                        },
                        child: Text('submit')),
                    SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String name = nameController.text.trim();
                          String contact = contactController.text.trim();
                          if (name.isNotEmpty && contact.isNotEmpty) {
                            setState(() {
                              nameController.text = '';
                              contactController.text = '';
                              contacts[selectedIndex].name = name;
                              contacts[selectedIndex].contact = contact;
                              selectedIndex = -1;
                            });
                          }
                        },
                        child: const Text('update'))
                  ],
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  "List Contact",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                contacts.isEmpty
                    ? const Text(
                        "Tidak ada Kontak",
                        style: TextStyle(fontSize: 11),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemCount: contacts.length,
                          itemBuilder: (context, index) => getRow(index),
                        ),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Text(
            contacts[index].name[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              contacts[index].name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              contacts[index].contact,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 70.0,
          child: Row(
            children: [
              InkWell(
                  onTap: (() {
                    //
                    nameController.text = contacts[index].name;
                    contactController.text = contacts[index].contact;
                    setState(() {
                      selectedIndex = index;
                    });
                    //
                  }),
                  child: Icon(Icons.edit)),
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      contacts.removeAt(index);
                    });
                    //
                  }),
                  child: Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
