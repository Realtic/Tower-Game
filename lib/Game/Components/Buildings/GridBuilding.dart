import 'dart:ui';

import 'package:box2d_flame/box2d.dart';

import 'package:towergame/Game/Components/Buildings/Building.dart';
import 'package:towergame/Game/Mixins/HasGameRef.dart';
import 'package:towergame/Game/Data/GridData.dart';
import 'package:towergame/Game/Components/Structures/HollowRectangleStructure.dart';
import 'package:towergame/Game/Components/Structures/SolidRectangleStructure.dart';
import 'package:towergame/Game/Grids/GridItem.dart';

// this is temporary somewhat
// like a controller class/obj for the structures
class GridBuilding extends Building with HasGameRef {
  GridData grid;
  Size gridItemSize;
  bool created = false;
  double gridWallWidth = 10;

  // for rendering from main game
  List<HollowRectangleStructure> structs = [];
  // for real rendering from main game
  List<dynamic> roomStructs = [];

  // for later access
  List<List<GridItem>> gridItems = [];

  GridBuilding(this.grid, Size size) : super(size);

  // TODO: instead of recreating the grid here - we should add the HOllowRectangularStructure to a 2D-List so we can later access them
  void createGrid() {
    if (created == true) {
      print("unable to create grid, created already");
      return;
    }

    created = true;

    gridItemSize = Size(size.width / 9, size.width / 9);

    int i = 0;
    int j;
    for (var gridItemList in grid.grid) {
      gridItems.insert(i, []);

      j = 0;
      for (var gridItem in gridItemList) {
        // add to our gridItems list<list>>..
        gridItems[i].insert(j, gridItem);

        // real struct rendering
        if (gridItem == null) {
          // something like if gridItem != null then draw rectangle with green border?
          Vector2 position = Vector2(j * gridItemSize.width,
              size.height - ((i + 0) * (gridItemSize.height + 0)));

          var rect = HollowRectangleStructure(gridItemSize, position,
              wallWidth: gridWallWidth);

          structs.add(rect);
        } else {
          print("got a non null grid item, add to real struct list");

          // something like if gridItem != null then draw rectangle with green border?
          Vector2 position = Vector2(j * gridItemSize.width,
              size.height - ((i + 0) * (gridItemSize.height + 0)));

          var rect = SolidRectangleStructure(gridItemSize, position);

          roomStructs.add(rect);
        }

        j++;
      }

      i++;
    }

    while (gridItems.length * gridItemSize.height < size.height) {
      print("loaded a grid that's shorter than it can be. growing grid height");
      growGridHeightOnce();
    }

    // Do it one last time such that it cover under the topbar
    growGridHeightOnce();
  }

  void growGridHeightOnce() {
    gridItems.add([]);

    // add each horizontal item (9 total horizontal)
    for (int i = 0; i < 9; i++) {
      gridItems[gridItems.length - 1].insert(i, null);

      Vector2 position = Vector2(i * gridItemSize.width,
          size.height - ((gridItems.length - 1) * (gridItemSize.height + 0)));
      structs.add(HollowRectangleStructure(gridItemSize, position,
          wallWidth: gridWallWidth));
    }
  }
}
