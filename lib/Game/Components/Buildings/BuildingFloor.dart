import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import 'package:towergame/Game/Mixins/HasGameRef.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloors.dart';

class BuildingFloor extends Component with HasGameRef, Resizable {
  int floorNum;

  BuildingFloors floorType;
  Sprite bgSprite;
  Rect bgRect;
  Size size;

  // TODO:
  int upgradeLevel = 1;
  bool upgrading = false;

  BuildingFloor(
    this.floorType,
  );

  // @override
  void onTapDown(TapDownDetails details) {
    print("tap up on floor #" + floorNum.toString());
  }

  @override
  void resize(Size size) {
    // bgRect = Rect.fromLTWH(
    //   0,
    //   0,
    //   size.width,
    //   size.height,
    // );
  }

  @override
  void render(Canvas c) {
    // if (!bgSprite.loaded()) {
    //   return;
    // }

    // bgSprite.renderRect(c, bgRect);
  }

  @override
  void update(double dt) {
    //
  }
}
