import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class GlobalLoading extends StatelessWidget {
  const GlobalLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: MyColors.acentColor,
      backgroundColor: MyColors.primaryColor,
      semanticsLabel: "Loading...",
      strokeWidth: 10,
      semanticsValue: "asdafs",
    );
  }
}
