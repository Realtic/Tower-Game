import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

import 'package:towergame/Pages/BottomTabbarMain.dart';
import 'package:towergame/Game/TowerGame.dart';

Future<void> main() async {
  // remove the status bar
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  runApp(MyApp(dbApp: null));
}

class Game {
  static TowerGame game = TowerGame();
}

class MyApp extends StatefulWidget {
  final Object dbApp;

  MyApp({this.dbApp});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Game',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BottomTabbarMain(game: Game.game),
      debugShowCheckedModeBanner: false,
    );
  }
}
