import 'package:flutter/material.dart';
import 'package:animate_practice/animate/animate_screen.dart';

void main() {
  runApp(const MyApp());
}

// 메인
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimateScreen(),
    );
  }
}
