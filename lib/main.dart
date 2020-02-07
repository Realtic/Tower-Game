import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:towergame/Pages/BottomTabbarMain.dart';
import 'package:towergame/Game/TowerGame.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // remove the status bar
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(new MyApp());
}

class Game {
  static TowerGame game = TowerGame();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Game',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BottomTabbarMain(game: Game.game),
      // home: MainPage(game: Game.game),
      debugShowCheckedModeBanner: false,
    );
  }
}
