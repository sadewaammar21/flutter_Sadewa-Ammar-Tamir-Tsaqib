import 'package:apk/bloc/contact_bloc.dart';
import 'package:apk/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alta - Flutter BloC',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => ContactBloc(),
        child: const MyHomePage(title: 'Alta - Flutter BloC'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _nameChangeController = TextEditingController();
  final _phoneChangeController = TextEditingController();

  @override
  dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer<ContactBloc, ContactState>(
        listener: (context, state) {
          if (state is ContactsLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Contacts Updated!')),
            );
          }
        },
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
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
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: _phoneController,
                    decoration:
                        const InputDecoration(labelText: 'Phone Number'),
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
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<ContactBloc>(context).add(
                        AddContactEvent(
                          Contact(
                            name: _nameController.text,
                            phoneNumber: _phoneController.text,
                          ),
                        ),
                      );
                      _nameController.clear();
                      _phoneController.clear();
                      setState(() {});
                    }
                  },
                  child: const Text('Add Contact'),
                ),
                // Display contacts
                if (state is ContactsLoaded)
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.contacts.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(state.contacts[index].name),
                          subtitle: Text(state.contacts[index].phoneNumber),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Edit
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    _nameChangeController.text =
                                        state.contacts[index].name;
                                    _phoneChangeController.text =
                                        state.contacts[index].phoneNumber;
                                    showDialog(
                                      context: context,
                                      builder: (dialogContext) {
                                        return AlertDialog(
                                          title: const Text('Edit Contact'),
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextFormField(
                                                controller:
                                                    _nameChangeController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText: 'Name'),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'nama harus disii';
                                                  }

                                                  List<String> nameParts =
                                                      value.split('');
                                                  if (nameParts.length < 2) {
                                                    return 'Nama Harus terdiri 2 kata';
                                                  }
                                                  for (String part
                                                      in nameParts) {
                                                    if (part[0] !=
                                                        part[0].toUpperCase()) {
                                                      return 'Diawali kapital';
                                                    }
                                                    if (value.contains(RegExp(
                                                        r'[0-9!@#$%^&*()_+={}\[\]:;"<>,.?/~`|\\]'))) {
                                                      return 'Nama tidak boleh mengandung angka atau karakter khusus.';
                                                    }
                                                    return null;
                                                  }
                                                },
                                              ),
                                              TextFormField(
                                                controller:
                                                    _phoneChangeController,
                                                decoration:
                                                    const InputDecoration(
                                                        labelText:
                                                            'Phone Number'),
                                                validator: (value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Nomor telepon harus diisi.';
                                                  }

                                                  if (!RegExp(r'^0\d{7,14}$')
                                                      .hasMatch(value)) {
                                                    return 'Nomor telepon tidak valid. Pastikan dimulai dengan angka 0, terdiri dari 8-15 digit, dan hanya berisi angka.';
                                                  }

                                                  return null; // Validasi berhasil
                                                },
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(dialogContext)
                                                    .pop();
                                              },
                                              child: const Text('Cancel'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                BlocProvider.of<ContactBloc>(
                                                        context)
                                                    .add(
                                                  UpdateContactEvent(
                                                    Contact(
                                                      name: state
                                                          .contacts[index].name,
                                                      phoneNumber: state
                                                          .contacts[index]
                                                          .phoneNumber,
                                                    ),
                                                    Contact(
                                                      name:
                                                          _nameChangeController
                                                              .text,
                                                      phoneNumber:
                                                          _phoneChangeController
                                                              .text,
                                                    ),
                                                  ),
                                                );
                                                _nameChangeController.clear();
                                                _phoneChangeController.clear();
                                                Navigator.of(dialogContext)
                                                    .pop();
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                      content: Text(
                                                          'Contact Updated!')),
                                                );
                                                setState(() {});
                                              },
                                              child: const Text('Update'),
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),

                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  showDialog(
                                    context: context,
                                    builder: (dialogContext) {
                                      return AlertDialog(
                                        title: const Text('Confirm Delete'),
                                        content: Text(
                                            'Are you sure you want to delete ${state.contacts[index].name}?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(dialogContext).pop();
                                            },
                                            child: const Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              BlocProvider.of<ContactBloc>(
                                                      context)
                                                  .add(
                                                DeleteContactEvent(
                                                    state.contacts[index].name),
                                              );
                                              Navigator.of(dialogContext).pop();
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Contact Deleted!')),
                                              );
                                              setState(() {});
                                            },
                                            child: const Text('Delete'),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
