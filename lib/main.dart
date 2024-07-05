import 'package:flutter/material.dart';
import 'package:purify/Pages/HomePage.dart';
import 'package:purify/Pages/CartPage.dart';
import 'package:purify/Pages/MyAccountScreen.dart';
import 'package:purify/Pages/MyOrdersScreen.dart';
import 'package:purify/Pages/MyWishListScreen.dart';
import 'package:purify/Pages/SettingsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RE:PLATE',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff5f5f3),
      ),
      routes: {
        "/": (context) => HomePage(),
        "/cartPage": (context) => CartPage(),
        "/myAccount": (context) => MyAccountScreen(),
        "/myOrders": (context) => MyOrdersScreen(),
        "/myWishList": (context) => MyWishListScreen(),
        "/settings": (context) => SettingsScreen(),
      },
    );
  }
}
