import 'package:flutter/material.dart';
import 'main.dart';

class Question extends StatelessWidget {
  final String quesion_Text;

  Question(this.quesion_Text);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10.0),
      child: Text(
        quesion_Text,
        style: TextStyle(fontSize: 25.0,color: font_color),
        textAlign: TextAlign.center,
      ),
    );
  }
}
