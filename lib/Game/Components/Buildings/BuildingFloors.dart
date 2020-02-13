enum BuildingFloors {
  PLAIN,
}

String floorEnumToString(BuildingFloors bg) {
  int index = BuildingFloors.values.indexOf(bg);
  if (index == 0) {
    return 'buildings/someroom_bg_anim.png';
  } else {
    return 'buildings/someroom_bg_anim.png';
  }
}
