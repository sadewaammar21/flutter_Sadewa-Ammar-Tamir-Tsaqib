import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  Color _currrentColor = Colors.orange;
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("InteractiveWidgets"),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
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
            const SizedBox(
              height: 5.0,
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
            ),
            SizedBox(
              height: 10.0,
            ),
            TextFormField(
              controller: contactController,
              keyboardType: TextInputType.phone,
              maxLength: 18,
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
            //buildDatePicker
            buildDatePicker(context),
            const SizedBox(
              height: 20.0,
            ),
            //builColorPicker
            buildColorPicker(context),
            //buildFilePicker
            const SizedBox(
              height: 10.0,
            ),
            buildFilePicker(context),

            SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                  onPressed: _submit,
                  child: Text("Submit"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF6750A4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Date'),
            TextButton(
              onPressed: () async {
                final selectDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 5),
                );
                setState(() {
                  if (selectDate != null) {
                    _dueDate = selectDate;
                  }
                });
              },
              child: const Text('Select'),
            )
          ],
        ),
        Text(DateFormat('dd-MM-yyyy').format(_dueDate))
      ],
    );
  }

  Widget buildColorPicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Color'),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 100,
          width: double.infinity,
          color: _currrentColor,
        ),
        Center(
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(_currrentColor),
            ),
            onPressed: () {
              showDialog(
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
                          }),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Save'))
                      ],
                    );
                  });
            },
            child: Text('Pick Color'),
          ),
        )
      ],
    );
  }

  Widget buildFilePicker(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Pick Files'),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
              _pickFile();
            },
            child: const Text('Pick and Open File '),
          ),
        )
      ],
    );
  }

  void _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    final file = result.files.first;
    _openFile(file);
    print("Nama File yang Diunggah: ${file.name}");
  }

  void _openFile(PlatformFile file) {
    OpenFile.open(file.path);
  }

  void _submit() {
    String name = nameController.text.trim();
    String contact = contactController.text.trim();
    String file = _pickFile.toString().trim();
    print("Nama pengguna contact: $name");
    print("No Contact: $contact");
    print("Tanggal yang Dipilih: $_dueDate");
    print("Warna yang Dipilih: $_currrentColor");
    print("file Yang di pilih $file");
  }
}
