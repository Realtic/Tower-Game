import 'dart:ui';

import 'package:box2d_flame/box2d.dart';
import 'package:flame/components/mixins/resizable.dart';

import 'package:towergame/Game/Mixins/HasGameRef.dart';
import 'package:towergame/Game/Components/Structures/Structure.dart';
import 'package:towergame/Game/Components/WorldObjects/RectangularWorldObject.dart';

class SolidRectangleStructure extends Structure with HasGameRef, Resizable {
  /// Position is the top left corner of the object,
  /// its rendered given that starting point.
  SolidRectangleStructure(Size size, Vector2 position) : super(size, position) {
    this.worldObjects.addAll([
      // ceiling
      RectangularWorldObject(Size(size.width, size.height), position,
          'buildings/someroom_bg_one.png'),
    ]);
  }

  @override
  void render(Canvas c) {
    for (var obj in worldObjects) {
      obj?.render(c);
    }
  }

  @override
  void update(double dt) {}

  @override
  void resize(Size size) {}
}
