import 'package:flutter/material.dart';
import 'package:my_team_app/util/my_colors.dart';

class Pastilla extends StatelessWidget {
  final Function onClick;
  final Icon icon;
  final Color color;
  final String title;

  const Pastilla({
    Key? key,
    required this.onClick,
    required this.icon,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shadowColor: this.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: InkWell(
        onTap: () {
          onClick();
        },
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 80,
          width: 80,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              this.icon,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
