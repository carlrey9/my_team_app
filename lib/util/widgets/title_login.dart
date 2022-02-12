import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class TittleLogin extends StatelessWidget {
  final String text;
  final Color color;
  const TittleLogin({Key? key, required this.text, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          color: this.color,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
