import 'package:aset/Home_Page.dart';
import 'package:aset/bloc/image_bloc.dart';
import 'package:aset/halaman_baru.dart';
import 'package:aset/halaman_form.dart';
import 'package:aset/item.dart';
import 'package:aset/prov_Page/provider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    // MultiProvider(
    //   providers: [
    //     ChangeNotifierProvider(create: (_) => Contact()),
    //     ChangeNotifierProvider(create: (_) => ImageModel()),
    //   ],
    //   child: const MyApp(),
    // ),

    MultiBlocProvider(
      providers: [
        BlocProvider<ImageBloc>(create: (_) => ImageBloc()),
        // Di sini Anda dapat menambahkan BlocProvider lain jika diperlukan
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HalamanBaru(),
    );
  }
}
