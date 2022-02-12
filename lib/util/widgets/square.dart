import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class Square extends StatelessWidget {
  final Color color;
  const Square({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _height = MediaQuery.of(context).size.height;
    final double _width = MediaQuery.of(context).size.width;
    return Transform.rotate(
      angle: 45,
      child: Container(
        width: _width,
        height: _width,
        decoration: BoxDecoration(
          color: this.color,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
