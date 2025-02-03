import 'package:animate_practice/animate/animation_movement.dart';
import 'package:flutter/material.dart';

class AnimationBall extends StatefulWidget {
  const AnimationBall({super.key});

  @override
  State<AnimationBall> createState() => _AnimationBallState();
}

class _AnimationBallState extends State<AnimationBall>
    with TickerProviderStateMixin, AnimationMovementMixin {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        print('======= AnimationBall Tap!!!! =======');

        // 애니메이션 중복 실행 방지
        if (sizeAnimationController.isAnimating ||
            bounceAnimationController.isAnimating) return;

        // 애니메이션 실행
        sizeAnimationController.forward();
        // bounceAnimationController.forward();
      },
      child: AnimatedBuilder(
        // Listenable.merge() =>  여러 개의 Listenable 객체들을 결합해 하나의 Listenable로 만드는 방법
        // ( ) 에 들어가야 할 것은? => 여기서는 Animation 객체일듯?
        animation: Listenable.merge([
          sizeAnimationController,
          bounceAnimationController,
          sizeAnimation,
          bounceAnimation
        ]),
        builder: (context, child) {
          return Container(
            width: sizeAnimation.value,
            height: sizeAnimation.value,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 255, 166, 65), // #FF9D00
              shape: BoxShape.circle,
            ),
          );
        },
      ),
    );
  }
}
