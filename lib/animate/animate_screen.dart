import 'package:animate_practice/animate/animation_ball.dart';
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
      // 배경 화면
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
      body: const Center(
        // 원형 볼
        child: AnimationBall(),
      ),
    );
  }
}
