import 'package:android_simpeg/home_page.dart';
import 'package:android_simpeg/login_page.dart';
<<<<<<< HEAD
import 'package:android_simpeg/pages/presensi_pages.dart';
import 'package:android_simpeg/pages/presensi_simpan.dart';
=======
>>>>>>> 61d8bcdf941b74ab1ec7d36a14351e32e68ea454
import 'package:android_simpeg/pegawai_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home:   LoginPage(),
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.blueGrey)
    );
  }
}
