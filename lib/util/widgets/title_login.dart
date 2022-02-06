import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class TittleLogin extends StatelessWidget {
  final String text;
  const TittleLogin({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Text(
        this.text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 40,
          color: Colors.orange,
          fontWeight: FontWeight.bold,
        ),
      ),
    ]);
  }
}
