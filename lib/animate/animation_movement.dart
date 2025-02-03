/*
import 'package:flutter/material.dart';

class AnimationMovement extends StatefulWidget {
  const AnimationMovement({super.key});

  @override
  State<AnimationMovement> createState() => _AnimationMovementState();
}

class _AnimationMovementState extends State<AnimationMovement> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

*/

// mixin
import 'package:flutter/material.dart';

mixin AnimationMovementMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  // 애니메이션 컨트롤러 정의
  late AnimationController sizeAnimationController;
  late AnimationController bounceAnimationController;

  late Animation<double> sizeAnimation; // 원형 볼 사이즈
  late Animation<double> bounceAnimation; // 원형 볼 커브

  @override
  void initState() {
    super.initState();

    // AnimationController sizeAnimationController 초기화
    sizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    sizeAnimation = Tween<double>(begin: 140, end: 219).animate(
      CurvedAnimation(
        parent: sizeAnimationController,
        curve: Curves.easeOut,
      ),
    );

    // 원래 크기로 복귀
    sizeAnimationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          sizeAnimationController.reverse();
        }
      },
    );

    // AnimationController bounceAnimationController 초기화
    bounceAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    sizeAnimationController.dispose();
    bounceAnimationController.dispose();
    super.dispose();
  }
}
