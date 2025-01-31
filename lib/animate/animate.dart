import 'package:flutter/material.dart';

class AnimateScreen extends StatefulWidget {
  const AnimateScreen({super.key});

  @override
  State<AnimateScreen> createState() => _AnimateScreenState();
}

class _AnimateScreenState extends State<AnimateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 242, 214),
        title: const Text('애니메이션 연습'),
        titleTextStyle: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 248, 200, 112),
        ),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: GestureDetector(
          onTap: ,
          child: Container(
            width: 140,
            height: 140,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 166, 65), // #FF9D00
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
