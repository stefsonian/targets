import 'dart:ui';

import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';

class TargetGameLoop extends BaseGame {
  bool hasWon = false;

  void render(Canvas canvas) {
    // TODO: implement render
    Rect bgRect = Rect.fromLTWH(0, 0, size.width, size.height);
    Paint bgPaint = Paint();
    bgPaint.color = Color(0xFFFF54D0E4);
    canvas.drawRect(bgRect, bgPaint);

    double screenCenterX = size.width / 2;
    double screenCenterY = size.height / 2;
    Rect boxRect =
        Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    Paint boxPaint = Paint();
    //boxPaint.color = Color(0xffffffff);

    if (hasWon) {
      boxPaint.color = Color(0xff00ff00);
    } else {
      boxPaint.color = Color(0xfff22fff);
    }
    canvas.drawRect(boxRect, boxPaint);
  }

  // print('w:' + size.width.toString() + 'h: ' + size.height.toString());

  void update(double t) {
    // TODO: implement update
  }

  void onTapDown(TapDownDetails d) {
    double screenCenterX = size.width / 2;
    double screenCenterY = size.height / 2;
    if (d.globalPosition.dx >= screenCenterX - 75 &&
        d.globalPosition.dx <= screenCenterX + 75 &&
        d.globalPosition.dy >= screenCenterY - 75 &&
        d.globalPosition.dy <= screenCenterY + 75) {
      hasWon = true;
    } else {
      hasWon = false;
    }
  }
}
