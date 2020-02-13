import 'dart:async';

import 'package:flame/animation.dart' as animation;
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';
import 'package:flame/position.dart';
import 'package:flutter/material.dart';

import 'package:towergame/Game/Components/Buildings/BuildingFloor.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloors.dart';

double _tileSize;

class BuildingFloorWidget extends StatelessWidget {
  BuildingFloorWidget(
    BuildingFloor floor,
    int level,
    double tileSize,
    BuildContext context,
  ) {
    initialize(floor, level, tileSize);
  }

  initialize(BuildingFloor floor, int level, double tileSize) async {
    // do some stuff here
    _tileSize = tileSize;
  }

  @override
  Widget build(BuildContext context) {
    return Flame.util.animationAsWidget(
      Position(_tileSize * 7, _tileSize * 1.75),
      animation.Animation.sequenced(
        'buildings/someroom_bg_anim.png',
        4,
        textureWidth: 128.0,
      ),
    );
  }
}
