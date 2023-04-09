import 'package:flutter/material.dart';
import 'package:zigy/screen/home_screen.dart';

void main() => runApp(const ZigyApp());

class ZigyApp extends StatefulWidget {
  const ZigyApp({super.key});

  @override
  State<ZigyApp> createState() => _ZigyAppState();
}

class _ZigyAppState extends State<ZigyApp> {
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
