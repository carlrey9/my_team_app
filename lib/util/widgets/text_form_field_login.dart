import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatelessWidget {
  final String label;
  final dynamic fn;
  const TextFormFieldLogin({
    Key? key,
    required this.label,
    this.fn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.blue[100],
          borderRadius: new BorderRadius.all(new Radius.circular(20))),
      child: TextFormField(
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(20),
            borderSide: new BorderSide(),
          ),
          label: Text(this.label),
        ),
      ),
    );
  }
}
