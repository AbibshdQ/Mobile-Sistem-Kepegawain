import 'package:android_simpeg/home_page.dart';
import 'package:android_simpeg/login.dart';
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
        home: HomePage(),
        theme: ThemeData(
            brightness: Brightness.light, primarySwatch: Colors.blueGrey)
    );
  }
}