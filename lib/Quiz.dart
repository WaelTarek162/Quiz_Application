import 'package:flutter/material.dart';
import 'Question.dart';
import 'Answer.dart';

class Quiz extends StatelessWidget {

  final index ;
  final List<Map<String, Object>> question;
  final Function Answer_question;

  const Quiz(this.index,this.question,this.Answer_question);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Question(
          question[index]['Question'].toString(),
        ),
        ...(question[index]['Answer'] as List<Map<String,Object>>).map((answer) {
          return Answer(()=>Answer_question(int.parse(answer['score'].toString())), answer['text'].toString());
        }).toList(),
      ],
    );
  }
}

