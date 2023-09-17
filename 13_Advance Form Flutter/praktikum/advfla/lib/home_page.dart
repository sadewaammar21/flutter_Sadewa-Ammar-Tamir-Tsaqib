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
    print("file Yang di pilih $_pickFile");
    print("Tanggal yang Dipilih: $_dueDate");
    print("Warna yang Dipilih: $_currrentColor");
  }
}
