import 'package:flutter/material.dart';
import 'package:flame/game.dart';
import 'package:flame/position.dart';

import 'package:towergame/Pages/ScrollSync/ScrollSync.dart';
import 'package:towergame/Game/TowerGame.dart';
import 'package:towergame/Game/TopBar/Widgets.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloor.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloors.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloorWidget.dart';

class GamePage2 extends StatelessWidget {
  final TowerGame game;
  final List<BuildingFloor> buildingFloors = [];
  final CustomScrollController _controller1 = CustomScrollController();
  final CustomScrollController _controller2 = CustomScrollController();

  GamePage2(this.game, {Key key}) : super(key: key);

  Widget _buildTopBarWidget(int index, double tileSize, BuildContext context) {
    Color topBarBgColor = Color.fromARGB(255, 150, 150, 150);
    return TopBarWidgets.build(index, tileSize, topBarBgColor, context);
  }

  Widget _buildGameView(BuildContext context, double tileSize) {
    buildingFloors.clear();

    // TODO: temporarily populate with dummy data, eventually read this data from disk & net
    buildingFloors.addAll([
      BuildingFloor(BuildingFloors.FIRST, context),
      BuildingFloor(BuildingFloors.SECOND, context),
      BuildingFloor(BuildingFloors.THIRD, context),
      BuildingFloor(BuildingFloors.FIRST, context),
      BuildingFloor(BuildingFloors.FOURTH, context),
      BuildingFloor(BuildingFloors.FIRST, context),
      BuildingFloor(BuildingFloors.SECOND, context),
      BuildingFloor(BuildingFloors.THIRD, context),
      BuildingFloor(BuildingFloors.FIRST, context),
      BuildingFloor(BuildingFloors.FOURTH, context),
      BuildingFloor(BuildingFloors.FIRST, context),
      BuildingFloor(BuildingFloors.SECOND, context),
      BuildingFloor(BuildingFloors.THIRD, context),
      BuildingFloor(BuildingFloors.FIRST, context),
      BuildingFloor(BuildingFloors.FOURTH, context),
      BuildingFloor(BuildingFloors.CONSTRUCTION, context),
      BuildingFloor(BuildingFloors.TMP_SPACER_FLOOR, context),
    ]);

    // get gridData
    print("size of game should be " +
        (tileSize * 1.75 * buildingFloors.length).toString());

    return ListView.builder(
      controller: _controller1,
      reverse: true,
      itemCount: buildingFloors.length,
      itemBuilder: (BuildContext context, int index) {
        buildingFloors[index].floorNum = index;

        // add the floor as a component to the game
        game.add(buildingFloors[index]);

        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(tileSize, 0.0, tileSize, 0.0),
            child: Card(
              elevation: 0,
              color: Color.fromARGB(0, 0, 0, 0),
              margin: EdgeInsets.zero,
              child: Container(
                width: tileSize * 7,
                height: tileSize * 1.75,
                child: BuildingFloorWidget(
                  buildingFloors[index],
                  index,
                  tileSize,
                  buildingFloors[index].floorType,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double tileSize = MediaQuery.of(context).size.width / 9;
    _controller1.addListener(() => _controller2
        .jumpToWithoutGoingIdleAndKeepingBallistic(_controller1.offset));
    _controller2.addListener(() => _controller1
        .jumpToWithoutGoingIdleAndKeepingBallistic(_controller2.offset));

    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bgs/grassy_bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: null,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight((tileSize * 0.7) * 2),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              flexibleSpace: Table(
                border: TableBorder.all(),
                defaultVerticalAlignment: TableCellVerticalAlignment.top,
                children: <TableRow>[
                  TableRow(
                    children: <Widget>[
                      _buildTopBarWidget(0, tileSize, context),
                      _buildTopBarWidget(1, tileSize, context),
                      _buildTopBarWidget(2, tileSize, context),
                    ],
                  ),
                  TableRow(
                    children: <Widget>[
                      _buildTopBarWidget(2, tileSize, context),
                      _buildTopBarWidget(2, tileSize, context),
                      _buildTopBarWidget(2, tileSize, context),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    IgnorePointer(
                      ignoring: false,
                      child: _buildGameView(context, tileSize),
                    ),
                    IgnorePointer(
                      ignoring: true,
                      child: ListView(
                        controller: _controller2,
                        reverse: true,
                        shrinkWrap: true,
                        padding: EdgeInsets.all(0.0),
                        children: <Widget>[
                          Card(
                            elevation: 0,
                            margin: EdgeInsets.zero,
                            color: Color.fromRGBO(0, 0, 0, 0.0),
                            child: EmbeddedGameWidget(
                              game,
                              size: Position(tileSize * 9 - 150,
                                  tileSize * 1.75 * buildingFloors.length),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
