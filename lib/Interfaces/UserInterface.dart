import 'dart:ui';

import 'package:flame/sprite.dart';

import 'package:spacegame/SpaceGame.dart';
import 'package:spacegame/Interfaces/BottomBarTabButton.dart';

class UserInterface {
  final SpaceGameMain game;

  // UI Sprites
  Sprite bottomInterfaceBar;

  // Bottom Bar Tab Data
  // Name: [Order Of Placement, Filename]
  Map<String, List<dynamic>> bottomBarTabMap = {
    'Home': [0, 'interfaces/home.png'],
    'Shop': [1, 'interfaces/shop.png'],
    'Chat': [2, 'interfaces/chat.png'],
    'Aliiance': [3, 'interfaces/alliance.png'],
  };

  // Default dimensions of the bottom bar tabs
  Size bottomBarButtonSize;

  // Holds the bottom bar tab button objects
  List<BottomBarTabButton> bottomBarTabs = [];

  // Physical dimensional item placement objs
  Rect backgroundDimensions;

  UserInterface(this.game) {
    // Main bottom bar interface items
    bottomInterfaceBar = Sprite('interfaces/interface_bar.png');

    // Create bottom tab interface buttons
    bottomBarButtonSize = Size(game.tileSize * 1.5, game.tileSize * 1.5);

    // Create each of the buttons and place it into bottomBarTabs
    bottomBarTabMap.forEach((k, v) {
      bottomBarTabs
          .add(BottomBarTabButton(game, v[0], k, bottomBarButtonSize, v[1]));
    });

    resize();
  }

  void render(Canvas c) {
    // Render bottom tabs
    bottomBarTabs.forEach((tab) {
      tab.render(c);
    });

    // Main bottom bar render
    bottomInterfaceBar.renderRect(c, backgroundDimensions);
  }

  void resize() {
    // Dimensions and placement of the background
    backgroundDimensions = Rect.fromLTWH(
      0,
      game.screenSize.height - (game.tileSize * 1.5),
      game.screenSize.width,
      game.tileSize * 1.5,
    );

    // Resize bottom tabs
    bottomBarTabs.forEach((tab) {
      tab.resize(
          tab.barIndex * bottomBarButtonSize.width,
          game.screenSize.height - bottomBarButtonSize.height,
          bottomBarButtonSize.width,
          bottomBarButtonSize.height);
    });
  }

  void update(double t) {
    // Update bottom tabs
    bottomBarTabs.forEach((tab) {
      tab.update(t);
    });
  }
}