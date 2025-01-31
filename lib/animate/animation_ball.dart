import 'package:animate_practice/animate/animation_movement.dart';
import 'package:flutter/material.dart';

class AnimationBall extends StatefulWidget {
  const AnimationBall({super.key});

  @override
  State<AnimationBall> createState() => _AnimationBallState();
}

class _AnimationBallState extends State<AnimationBall>
    with TickerProviderStateMixin, AnimationMovementMixin {
  // 원형 볼 사이즈
  double ballSize = 140;

  // initState => 상태 초기화 (위젯이 처음으로 생성될 때 한 번만 호출됨)
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          print('======= AnimationBall Tap!!!! =======');
          // setState(() {
          //   ballSize = ballSize == 140 ? 219 : 140;
          // });
        },
        child: AnimatedBuilder(
            animation: Listenable.merge(listenables),
            builder: (context, child) {
              return Container(
                // width: ballSize,
                // height: ballSize,
                width: 140,
                height: 140,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 255, 166, 65), // #FF9D00
                  shape: BoxShape.circle,
                ),
              );
            }));
  }
}
