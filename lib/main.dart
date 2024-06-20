import 'package:flutter/material.dart';
import 'package:purify/screen/home.dart';  // Sesuaikan dengan path yang benar
import 'package:purify/screen/login.dart';
import 'package:purify/screen/signup.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RE:PLATE',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),  // Ganti dengan widget yang ingin dijadikan halaman awal
      routes: {
        '/login': (context) => Login(),
        '/home': (context) => Home(),
        '/signup': (context) => SignUp(),
      },
    );
  }
}
