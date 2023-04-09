import 'package:flutter/material.dart';
import 'package:zigy/screen/home_screen.dart';

void main() => runApp(const ZigyApp());

class ZigyApp extends StatelessWidget {
  const ZigyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Zigy API Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFF020202),
        ),
        home: const HomeScreen());
  }
}
