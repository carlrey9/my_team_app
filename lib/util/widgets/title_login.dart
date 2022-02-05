import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class TittleLogin extends StatelessWidget {
  final String text;
  const TittleLogin({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: MyColors.primaryColor,
        fontSize: 35,
      ),
      maxLines: 2,
      semanticsLabel: "Tittle",
      textAlign: TextAlign.center,
    );
  }
}
