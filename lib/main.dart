import 'package:flutter/material.dart';
import 'package:purify/Pages/HomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'RE:PLATE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff5f5f3),
      ),
      routes: {
        "/" : (context)=>HomePage(),
      },
    );
  }
}