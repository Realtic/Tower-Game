import 'dart:io' show Platform;

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:towergame/Pages/BottomTabbarMain.dart';
import 'package:towergame/Game/TowerGame.dart';

Future<void> main() async {
  // remove the status bar
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays([]);

  // setup firebase db
  final FirebaseApp fbApp = await FirebaseApp.configure(
    name: 'db2',
    options: Platform.isIOS
        // TODO: IOS
        ? const FirebaseOptions(
            googleAppID: '1:297855924061:ios:c6de2b69b03a5be8',
            gcmSenderID: '297855924061',
            databaseURL: 'https://flutterfire-cd2f7.firebaseio.com',
          )
        : const FirebaseOptions(
            googleAppID: '1:11043315046:android:bb72e5d8bb03a043427ca7',
            apiKey: 'AIzaSyB8SZy0S1Sq_ueXKpjr1L1w3V8BttwPTO4',
            databaseURL: 'https://tower-game-20105.firebaseio.com',
          ),
  );

  runApp(MyApp(firebaseApp: fbApp));
}

class Game {
  static TowerGame game = TowerGame();
}

class MyApp extends StatefulWidget {
  final FirebaseApp firebaseApp;

  MyApp({this.firebaseApp});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // final FirebaseDatabase database = FirebaseDatabase(app: widget.firebaseApp);
    // database.reference().child('users').once().then((DataSnapshot snapshot) {
    //   print('Connected to second database and read ${snapshot.value}');
    // });

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
