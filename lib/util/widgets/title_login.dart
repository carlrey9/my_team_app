import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class TittleLogin extends StatelessWidget {
  final String text;
  const TittleLogin({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          foreground: Paint()..color = MyColors.primaryColor,
        ),
      ),
      Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 40,
            foreground: Paint()
              ..strokeWidth = 1
              ..color = MyColors.textIcons
              ..style = PaintingStyle.stroke),
      ),
    ]);
  }
}
