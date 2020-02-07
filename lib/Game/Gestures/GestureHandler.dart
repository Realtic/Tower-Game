import 'package:flutter/gestures.dart';

import 'package:towergame/Game/TowerGame.dart';

class GestureHandler {
  final TowerGame game;

  GestureHandler(this.game) {
    game.gestureCoverage = {
      'tapDown': Map(),
      'tapUp': Map(),
    };
  }

  void onTapDown(TapDownDetails d) {
    game.gestureCoverage['tapDown']?.forEach((k, v) {
      if (v.contains(d.globalPosition)) {
        k.onTapDown();
        return;
      }
    });
  }

  void onTapUp(TapUpDetails d) {
    game.gestureCoverage['tapUp']?.forEach((k, v) {
      if (v.contains(d.globalPosition)) {
        k.onTapUp();
        return;
      }
    });
  }
}
