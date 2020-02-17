import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';

import 'package:towergame/Game/Mixins/HasGameRef.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloors.dart';

class BuildingFloor extends Component with HasGameRef, Resizable {
  int floorNum;

  BuildingFloors floorType;
  Sprite bgSprite = Sprite("interfaces/playbutton.png");
  Rect bgRect;
  Size size;

  // TODO:
  int upgradeLevel = 1;
  bool upgrading = false;

  BuildContext ctx;

  BuildingFloor(
    this.floorType,
    this.ctx,
  );

  // @override
  void onTapUp(TapUpDetails details) {
    if (floorType == BuildingFloors.CONSTRUCTION) {
      _showDialogCancelConstruction(ctx);
      return;
    }
    print("tap up on floor #" + floorNum.toString());
  }

  @override
  void resize(Size size) {
    bgRect = Rect.fromLTWH(
      0,
      0,
      size.width / 9,
      size.width / 9,
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
  void update(double dt) {
    //
  }

  void _showDialogCancelConstruction(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text("Cancel construction of the floor?"),
          actions: <Widget>[
            RaisedButton(
              child: Text("Yes, cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            RaisedButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
