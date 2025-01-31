import 'dart:math';

import 'package:flutter/material.dart';

class CustomBounceCurve extends Curve {
  @override
  // t =>  애니메이션의 진행 비율
  double transform(double t) {
    const double amplitude = 0.5; // 진폭
    const double period = 0.4; // 주기

    // 초기 조건
    if (t == 0.0) return 0.0; // 애니메이션이 시작될 때
    if (t == 1.0) return 1.0; // 애니메이션이 끝날 때

    // 바운스 애니메이션 계산
    return 1.0 -
        amplitude *
            pow(2.0, -10.0 * t) *
            sin((t - period / 4.0) * (2 * pi) / period);
  }
}
