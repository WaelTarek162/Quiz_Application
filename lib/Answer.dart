import 'package:flutter/material.dart';
import 'main.dart';
class Answer extends StatelessWidget {
  final String ansuwer_text;
  final Function() f;
   Answer(this.f,this.ansuwer_text);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      width: double.infinity,
      child:  ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Button_color,textStyle: TextStyle(fontSize: 25.0,color: font_color)),
        onPressed:f,
        child: Text(
          ansuwer_text,
          style: TextStyle(fontSize: 25,color: font_color),
        ),
      ),
    );
  }
}

