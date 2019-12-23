import 'dart:ui';

import 'package:targets/targetGameLoop.dart';

class Fly {
  final TargetGameLoop game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;
  bool isOffScreen = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xFF3562f4);
  }
  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {
    if (isDead) {
      // print(game.tileSize.toString());
      // print(t.toString());
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.size.height) {
        isOffScreen = true;
      }
    }
  }

  void onTapDown() {
    flyPaint.color = Color(0xffff4757);
    isDead = true;
  }
}
