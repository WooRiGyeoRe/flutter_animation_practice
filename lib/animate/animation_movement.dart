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
import 'package:animate_practice/animate/custom_bounceout_curve.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

mixin AnimationMovementMixin<T extends StatefulWidget>
    on State<T>, TickerProviderStateMixin<T> {
  // 애니메이션 컨트롤러 정의
  late AnimationController sizeAnimationController;
  late AnimationController bounceAnimationController;

  late Animation<double> sizeAnimation; // 원형 볼 사이즈
  late Animation<double> bounceAnimation; // 원형 볼 커브

  // initState => 상태 초기화 (위젯이 처음으로 생성될 때 한 번만 호출됨)
  @override
  void initState() {
    super.initState();

    // AnimationController sizeAnimationController 초기화
    sizeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 380),
    );

    sizeAnimation = Tween<double>(begin: 140, end: 219).animate(
      CurvedAnimation(
        parent: sizeAnimationController,
        // curve: Curves.easeOut,  => 기본 사용
        // SpringSimulation 대신 Cubic 베지어 곡선 이용
        curve: const Cubic(0.23, 0.86, 0.29, 1),
      ),
    );

    // 원래 크기로 복귀
    sizeAnimationController.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          // sizeAnimationController.reverse();
          await Future.delayed(const Duration(microseconds: 200));
          bounceAnimationController.forward();
        }
      },
    );

    // AnimationController bounceAnimationController 초기화
    bounceAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    bounceAnimation = Tween<double>(begin: 219, end: 140).animate(
      CurvedAnimation(
        parent: bounceAnimationController,
        curve: CustomBounceCurve(),
      ),
    );
    // setState(() {});

    bounceAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        sizeAnimationController.reset();
        bounceAnimationController.reset();
      }
    });
  }

  @override
  void dispose() {
    sizeAnimationController.dispose();
    bounceAnimationController.dispose();
    super.dispose();
  }
}
