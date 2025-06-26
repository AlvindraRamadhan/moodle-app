import 'package:flutter/material.dart';
import 'load_screen.dart'; // Pastikan file ini sesuai dengan file kamu

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moodle App',
      debugShowCheckedModeBanner: false,
      home: const LoadScreen(), // Panggil layar splash di sini
    );
  }
}
