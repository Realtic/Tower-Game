import 'dart:async';

import 'package:flame/util.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:spacegame/SpaceGame.dart';

void main() async {
  // Wait for flame setup
  await setupFlame();
  SpaceGameMain game = new SpaceGameMain();

  // Start game
  runApp(game.widget);
}

/// Setup all Flame specific parts
Future setupFlame() async {
  var flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  await Flame.images.loadAll([
    // backgrounds
    'bgs/space_tall.png',
    'bgs/space_wide.jpg',
    // interface items
    'interfaces/interface_bar.png',
    'interfaces/alliance.png',
    'interfaces/cash.png',
    'interfaces/chat.png',
    'interfaces/crystal.png',
    'interfaces/gems.png',
    'interfaces/home.png',
    'interfaces/level.png',
    'interfaces/metal.png',
    'interfaces/shop.png',
    // structures
    'structures/structure_horizontal_rectangle_shell.png',
    'structures/structure_vertical_rectangle_shell.png',
  ]);
}