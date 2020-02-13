import 'dart:async';
import 'dart:math';

import 'package:flame/animation.dart' as animation;
import 'package:flame/sprite.dart';
import 'package:flame/flame.dart';
import 'package:flame/position.dart';
import 'package:flutter/material.dart';

import 'package:towergame/Game/Components/Buildings/BuildingFloor.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloors.dart';

class BuildingFloorWidget extends StatefulWidget {
  final BuildingFloor floor;
  final BuildingFloors floorType;
  final double tileSize;
  final int level;

  const BuildingFloorWidget(
      this.floor, this.level, this.tileSize, this.floorType,
      {Key key})
      : super(key: key);

  @override
  _BuildingFloorWidget createState() {
    return _BuildingFloorWidget();
  }
}

class _BuildingFloorWidget extends State<BuildingFloorWidget> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> floorInfo = floorEnumToString(widget.floorType);

    return Stack(
      children: <Widget>[
        GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTapDown: widget.floor.onTapDown,
            child: null),
        Flame.util.animationAsWidget(
          Position(widget.tileSize * 7, widget.tileSize * 1.75),
          animation.Animation.sequenced(
            floorInfo["path"],
            floorInfo["frames"],
            textureWidth: 128.0,
            stepTime: Random().nextDouble() + 0.1,
          ),
        ),
        Text("floor #" + widget.level.toString()),
      ],
    );
  }
}
