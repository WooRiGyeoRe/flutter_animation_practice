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

    }
