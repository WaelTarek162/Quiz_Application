import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class Result extends StatelessWidget {
  final Function() F;
  final Total_Score;

  Result(this.F, this.Total_Score);

  String get result_grade
  {
  String grade;
  if(Total_Score>=85){
  grade='Congrats! You Got an Excellent grade.';
  }
  else if(Total_Score>=75){
  grade='Congrats! You Got a Very good grade.';}
  else if(Total_Score>=65){
    grade='Congrats! You Got a good grade.';}
  else if(Total_Score>=50){
    grade='Congrats! You Got a satisfactory grade.';}
  else{
    grade='Sorry! you failed.';
  }

  return grade;
  }


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
             result_grade,
              style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold,color: font_color ),
            ),
            TextButton(
                onPressed: F,
                child: Text(
                  'Restart The Quiz.',
                  style: TextStyle(fontSize: 40.0, color: Button_color),
                ))
          ]),
    );
  }
}
