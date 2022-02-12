import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

appBarAll() {
  return AppBar(
    backgroundColor: MyColors.primaryColor,
  );
}

appBarAllTittle(Widget tittle) {
  return AppBar(
    backgroundColor: MyColors.primaryColor,
    title: tittle,
  );
}
