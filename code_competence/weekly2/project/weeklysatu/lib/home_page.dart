import 'package:flutter/material.dart';
import 'package:weeklysatu/verik.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  List<Verivikasi> contacts = List.empty(growable: true);
  void _showAlertDialog() {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Ulasan Anda"),
            content: Text(
              "Nama   : ${firstName.text} ${lastName.text}\n"
              "Email    : ${email.text}\n"
              "Ulasan  : ${deskripsi.text}",
            ),
            actions: <Widget>[
              TextButton(onPressed: () {}, child: Text("Kirim")),
              TextButton(
                child: Text("Kembali"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                "SideBar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: Text("Contact Us"),
              onTap: () {},
            ),
            ListTile(
              title: Text("About Us"),
              onTap: () {},
            ),
            ListTile(
              title: Text("Login"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Center(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Icon(
                      Icons.home_work_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                    const Text("Silahan Mendaftar Pada PlattFom Ini "),
                    const Text("Tunggu Apalagi paltform Ini menjajikan penuh "),
                    const Text("atas kualitasnya"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Contact US",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text("'Pada product kami berikanlah ulasan "),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Tindakan yang ingin Anda lakukan saat kata di-klik
                      },
                      child: RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'dengan cara ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Klik disini',
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: firstName,
                      decoration: const InputDecoration(
                          hintText: 'Insert First Name',
                          labelText: 'first Name*',
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama harus disii';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: lastName,
                      decoration: const InputDecoration(
                        hintText: 'Input Last Name',
                        labelText: 'Last Name *',
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama harus disii';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: 'Input Email',
                        labelText: 'email *',
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama harus disii';
                        }
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: deskripsi,
                      decoration: const InputDecoration(
                        hintText: 'Input Saran dan Kritik',
                        labelText: 'Ulasan *',
                        filled: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama harus disii';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Menampilkan AlertDialog
                        _showAlertDialog();
                      },
                      child: Text("Submit"),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "About Us",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              "Program Analisa",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "Analisa teknikal crypto merupakan metode untuk mengevaluasi harga kripto dengan melihat grafik dan indikator lain seperti: indikator teknikal, pola grafik hingga level support untuk mengidentifikasi pola dan tren."),
                          ),
                        ),
                        Card(
                          elevation: 3,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              "Kegunaan Crypto",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                                "contohnya Cryptocurrency dapat digunakan sebagai penyimpan nilai, dapat digunakan sebagai alat tukar, dan dapat bertindak sebagai sarana investas"),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "Masukan Email",
                          filled: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama harus disii';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "Masukkan Paswword",
                          filled: true),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'nama harus disii';
                        }
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text("Submit"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
