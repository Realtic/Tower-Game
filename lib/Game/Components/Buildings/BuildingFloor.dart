import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';

import 'package:towergame/Game/Mixins/HasGameRef.dart';

class BuildingFloor extends Component with HasGameRef, Resizable {
  Sprite bgSprite;
  Rect bgRect;
  Size size;

  BuildingFloor(this.size);

  @override
  void resize(Size size) {
    bgRect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
  }

  @override
  void render(Canvas c) {
    if (!bgSprite.loaded()) {
      return;
    }

    bgSprite.renderRect(c, bgRect);
  }

  @override
  void update(double dt) {}
}
