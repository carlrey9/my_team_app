import 'package:flutter/material.dart';

class SubTittleLogin extends StatelessWidget {
  final String text;
  const SubTittleLogin({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(fontSize: 20));
  }
}
