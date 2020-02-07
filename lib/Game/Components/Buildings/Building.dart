import 'dart:ui';

import 'package:flame/components/mixins/resizable.dart';

import 'package:towergame/Game/Mixins/HasGameRef.dart';

class Building with HasGameRef, Resizable {
  Size size;

  Building(this.size);

  @override
  void resize(Size size) {
    this.size = size;
  }
}
