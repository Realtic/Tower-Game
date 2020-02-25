import 'package:flutter/material.dart';

import 'package:towergame/Game/TowerGame.dart';
import 'package:towergame/Pages/ItemPage.dart';
import 'package:towergame/Pages/GamePage.dart';
import 'package:towergame/Pages/GamePage2.dart';

class BottomTabbarMain extends StatefulWidget {
  final TowerGame game;

  const BottomTabbarMain({
    Key key,
    this.game,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BottomTabbarMainState();
}

class _BottomTabbarMainState extends State<BottomTabbarMain>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  int _selectedPage = 2;
  ItemPage _itemPage;

  List<Widget> _kTabPages = <Widget>[];

  List<Widget> _initTabPages() {
    print("init tab pages where page is " + _itemPage.initialPage.toString());
    _kTabPages.removeRange(0, _kTabPages.length);
    return [
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("tmp"),
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: _itemPage,
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: GamePage2(widget.game), //widget.game
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("Army"),
            ),
          ],
        ),
      ),
      Center(
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              color: Colors.grey,
              child: Text("Alliance"),
            ),
          ],
        ),
      ),
    ];
  }

  static const _kTabs = <Tab>[
    Tab(
      icon: Icon(
        Icons.cloud,
        size: 22,
      ),
      text: 'Game',
    ),
    Tab(
      icon: Icon(
        Icons.alarm,
        size: 22,
      ),
      text: 'Items',
    ),
    Tab(
      icon: Icon(
        Icons.map,
        size: 22,
      ),
      text: 'Game2',
    ),
    Tab(
      icon: Icon(
        Icons.directions_boat,
        size: 22,
      ),
      text: 'Army',
    ),
    // NOTE: chat will be a sliver bar above the bottom bar viewable in ~some~ views only
    // Tab(
    //   icon: Icon(
    //     Icons.forum,
    //     size: 22,
    //   ),
    //   text: 'Chat',
    // ),
    Tab(
      icon: Icon(
        Icons.account_balance,
        size: 22,
      ),
      text: 'Alliance',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: 2,
    );

    _itemPage = ItemPage(0);
    _kTabPages = _initTabPages();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // void changePageOn() {
  //   setState(() {
  //     _itemPage = ItemPage(1);
  //     _kTabPages = _initTabPages();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: TabBarView(
        children: _kTabPages,
        controller: _tabController,
      ),
      bottomNavigationBar: Material(
        color: Colors.blue[900],
        child: TabBar(
          tabs: _kTabs,
          controller: _tabController,
          onTap: (int clickedPageTab) {
            if (_selectedPage == clickedPageTab) {
              print("clicked on tab that ur already on!");
              // changePageOn();
            }

            _selectedPage = clickedPageTab;
          },
        ),
      ),
    );
  }
}
