import 'dart:ui';
import 'dart:math';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:targets/fly.dart';

class TargetGameLoop extends BaseGame {
  bool hasWon = false;
  Color backgroundColor() => Color(0xFFFF54D0E4);
  double tileSize;
  bool isInitialized = false;
  List<Fly> flies = [];
  Random rnd;

  // TargetGameLoop() {
  //   initialize();
  // }

  void spawnFly() {
    double x = rnd.nextDouble() * (size.width - tileSize);
    double y = rnd.nextDouble() * (size.height - tileSize);
    flies.add(Fly(this, x, y));
    // print(flies.length.toString());
  }

  void render(Canvas canvas) {
    if (!isInitialized) {
      tileSize = size.width / 9;
      rnd = Random();
      spawnFly();
      spawnFly();
      spawnFly();

      isInitialized = true;
    }
    // double screenCenterX = size.width / 2;
    // double screenCenterY = size.height / 2;
    // Rect boxRect =
    //     Rect.fromLTWH(screenCenterX - 75, screenCenterY - 75, 150, 150);
    // Paint boxPaint = Paint();

    // if (hasWon) {
    //   boxPaint.color = Color(0xff00ff00);
    // } else {
    //   boxPaint.color = Color(0xfff22fff);
    // }
    // canvas.drawRect(boxRect, boxPaint);

    flies.forEach((Fly fly) => fly.render(canvas));
  }

  // print('w:' + size.width.toString() + 'h: ' + size.height.toString());

  void update(double t) {
    flies.forEach((Fly fly) => fly.update(t));
    flies.removeWhere((Fly fly) => fly.isOffScreen);
  }

  void onTapDown(TapDownDetails d) {
    // double screenCenterX = size.width / 2;
    // double screenCenterY = size.height / 2;
    // if (d.globalPosition.dx >= screenCenterX - 75 &&
    //     d.globalPosition.dx <= screenCenterX + 75 &&
    //     d.globalPosition.dy >= screenCenterY - 75 &&
    //     d.globalPosition.dy <= screenCenterY + 75) {
    //   hasWon = true;
    // } else {
    //   hasWon = false;
    // }
    int fliesHit = 0;
    flies.forEach((Fly fly) {
      if (fly.flyRect.contains(d.globalPosition)) {
        fly.onTapDown();
        fliesHit++;
      }
    });
    for (var i = 0; i < fliesHit; i++) {
      spawnFly();
    }
  }
}
