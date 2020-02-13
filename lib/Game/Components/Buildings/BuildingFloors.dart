enum BuildingFloors {
  TMP_SPACER_FLOOR,
  // construction floor
  CONSTRUCTION,
  // other real floors
  FIRST,
  SECOND,
  THIRD,
  FOURTH,
}

Map<String, dynamic> floorEnumToString(BuildingFloors bg) {
  int index = BuildingFloors.values.indexOf(bg);
  if (index == 0) {
    return {
      "path": "buildings/tmp_spacer_room.png",
      "frames": 1,
    };
  } else if (index == 1) {
    return {
      "path": "buildings/under_construction.png",
      "frames": 18,
    };
  } else if (index == 2) {
    return {
      "path": "buildings/someroom_bg_anim_one.png",
      "frames": 10,
    };
  } else if (index == 3) {
    return {
      "path": "buildings/someroom_bg_anim_two.png",
      "frames": 10,
    };
  } else if (index == 4) {
    return {
      "path": "buildings/someroom_bg_anim_three.png",
      "frames": 10,
    };
  } else if (index == 5) {
    return {
      "path": "buildings/someroom_bg_anim_four.png",
      "frames": 10,
    };
  } else {
    return {
      "path": "buildings/someroom_bg_anim_one.png",
      "frames": 10,
    };
  }
}
