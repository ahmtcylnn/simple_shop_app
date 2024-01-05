import 'package:flutter/material.dart';
import 'package:http_demo_engindemirog/screens/cart_screen.dart';
import 'package:http_demo_engindemirog/screens/main_screen.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/cart": (BuildContext context) => const CartScreen(),
      },
      home: const MainScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
