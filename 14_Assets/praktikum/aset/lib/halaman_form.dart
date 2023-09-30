import 'package:aset/Home_Page.dart';
import 'package:aset/halaman_baru.dart';
import 'package:aset/item.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  String selectedColorName = '';
  int index = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  Future<void> buildDatePicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: DateTime(1990),
      lastDate: DateTime(currentDate.year + 5),
    );

    if (selectedDate != null) {
      setState(() {
        _dueDate = selectedDate;
      });
    }
  }

  List<PlatformFile> files = [];

  Future<void> pickFiles() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: true,
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'png', 'txt'],
      );

      if (result != null) {
        setState(() {
          files = result.files;
        });
      }
    } catch (e) {
      print('Error picking files: $e');
    }
  }

  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currrentColor = Colors.orange;
  @override
  Widget build(BuildContext context) {
    final contactProv = Provider.of<Contact>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kontak'),
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
                            AddContact()), // Navigasi ke Halaman Form
                  );
                },
                title: const Text(
                  'Contact ',
                  style: TextStyle(color: Colors.blue),
                )),
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
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Column(
                  children: [
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
                    TextField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Nama',
                        hintText: 'Insert Your Name',
                        filled: true,
                        fillColor: Color.fromARGB(255, 244, 188, 246),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: _phoneController,
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            buildDatePicker(context);
                          },
                          child: Text('Pilih Tanggal'),
                        ),
                        Text(
                          DateFormat('dd-MM-yyyy').format(_dueDate),
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 20.0,
                    ),
                    //builColorPicker
                    ElevatedButton(
                      onPressed: () {
                        buildColorPicker(context);
                      },
                      child: Container(
                        child: Ink(
                          decoration: BoxDecoration(
                            color: _currrentColor,
                          ),
                          child: InkResponse(
                            onTap: () {
                              buildColorPicker(context);
                            },
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 50),
                              alignment: Alignment.center,
                              child: const Text(
                                'Pilih Warna',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        pickFiles();
                      },
                      child: Text('Pilih File'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (index >= 0 && index < files.length) {
                          contactProv.add({
                            'name': _nameController.text,
                            'phone': _phoneController.text,
                            'Tanggal':
                                DateFormat('dd-MM-yyyy').format(_dueDate),
                            'files': files[index].name,
                            'color': selectedColorName,
                          });
                        } else {
                          // Handle kesalahan jika indeks tidak valid
                          print('Kesalahan: Indeks tidak valid');
                        }
                      },
                      child: const Text('Tambah'),
                    ),
                  ],
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: contactProv.contacs.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(contactProv.contacs[index]['name']!),
                      leading: CircleAvatar(
                        backgroundColor: Colors.amber,
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(contactProv.contacs[index]['phone']!),
                          Text(contactProv.contacs[index]['Tanggal']!),
                          Text(contactProv.contacs[index]['color']!),
                          Text(contactProv.contacs[index]['files']!),
                        ],
                      ),
                      trailing: SizedBox(
                        width: 70.0,
                        child: Row(
                          children: [
                            InkWell(
                                onTap: (() {
                                  //

                                  //
                                }),
                                child: Icon(Icons.edit)),
                            InkWell(
                                onTap: (() {
                                  //
                                  setState(() {
                                    contactProv.remove(index);
                                  });
                                  //
                                }),
                                child: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDateSelector(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                await buildDatePicker(context);
              },
              child: const Text('Select'),
            )
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate)),
      ],
    );
  }

  void buildColorPicker(BuildContext context) async {
    Color newColor = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pick Your Color'),
          content: BlockPicker(
            pickerColor: _currrentColor,
            onColorChanged: (color) {
              setState(() {
                _currrentColor = color;
              });
            },
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, _currrentColor);
              },
              child: const Text('Save'),
            )
          ],
        );
      },
    );

    if (newColor != null) {
      setState(() {
        _currrentColor = newColor;

        selectedColorName = getColorName(newColor);
      });
    }
  }

  String getColorName(Color color) {
    return ' $_currrentColor';
  }
}
