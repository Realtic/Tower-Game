import 'package:flutter/material.dart';

import 'package:towergame/Pages/Item/ItemPages/ItemPage.dart'
    as ViewableItemPage;
import 'package:towergame/Pages/Item/ItemStore.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _kTabPages = <Widget>[
      Center(
        child: ViewableItemPage.ItemPage(
          itemType: ItemType.TYPE_ONE,
        ),
      ),
      Center(
        child: ViewableItemPage.ItemPage(
          itemType: ItemType.TYPE_TWO,
        ),
      ),
      Center(
        child: ViewableItemPage.ItemPage(
          itemType: ItemType.TYPE_THREE,
        ),
      ),
    ];

    final _kTabs = <Tab>[
      Tab(
        icon: Icon(Icons.cloud),
        text: 'Type 1',
      ),
      Tab(
        icon: Icon(Icons.alarm),
        text: 'Type 2',
      ),
      Tab(
        icon: Icon(Icons.forum),
        text: 'Type 3',
      ),
    ];

    return DefaultTabController(
      length: _kTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Item Inventory'),
          backgroundColor: Colors.blue[900],
          bottom: TabBar(
            tabs: _kTabs,
          ),
        ),
        body: TabBarView(
          children: _kTabPages,
        ),
      ),
    );
  }
}
