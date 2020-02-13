import 'package:flutter/material.dart';

import 'package:towergame/Game/TowerGame.dart';
import 'package:towergame/Game/TopBar/Widgets.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloor.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloors.dart';
import 'package:towergame/Game/Components/Buildings/BuildingFloorWidget.dart';

class GamePage2 extends StatelessWidget {
  final TowerGame game;
  final List<BuildingFloor> buildingFloors = [];

  GamePage2({Key key, this.game}) : super(key: key);

  Widget _buildTopBarWidget(int index, double tileSize, BuildContext context) {
    return TopBarWidgets.build(index, tileSize, context);
  }

  Widget _buildGameView(BuildContext context, double tileSize) {
    buildingFloors.addAll([
      // BuildingFloor(Size(tileSize * 5, tileSize), bg: BuildingFloors.PLAIN),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
      BuildingFloor(Size(tileSize * 5, tileSize)),
    ]);

    // get gridData

    return ListView.builder(
      itemCount: buildingFloors.length,
      itemBuilder: (BuildContext context, int index) {
        BuildingFloor floor = buildingFloors[index];
        return Align(
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.fromLTRB(tileSize, 0.0, tileSize, 0.0),
            // child: BuildingFloorWidget(floor, index, context),
            child: Card(
              child: Container(
                width: tileSize * 7,
                height: tileSize * 1.75,
                child: BuildingFloorWidget(floor, index, tileSize, context),
              ),
              margin: EdgeInsets.zero,
            ),
            // ListTile(
            //   // title: Positioned.fill(
            //   //   child: BuildingFloorWidget(floor, index, tileSize, context),
            //   // ),
            //   title: BuildingFloorWidget(floor, index, tileSize, context),
            //   leading: null,
            //   subtitle: null,
            // ),
          ),
        );
      },
      reverse: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    double tileSize = MediaQuery.of(context).size.width / 9;

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
          body: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Positioned.fill(
                child: _buildGameView(context, tileSize),
                // child: GestureDetector(
                //   behavior: HitTestBehavior.opaque,
                //   onTapDown: game.onTapDown,
                //   child: _buildGameView(context, tileSize),
                // ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
