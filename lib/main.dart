import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'Result.dart';

//Colors theme
Color font_color =Colors.black;
Color Button_color =Colors.blueAccent;
Color Back_ground_color =Colors.white;


void main() {
  return runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool Dark_mode=false;
  int index = 0;
  double total_Score = 0.0;
  List <double> cash=[];


//simple dataset
  final List<Map<String, Object>> _question = [
    {
      'Question': 'What\'s your favourite color?',
      'Answer': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 20},
        {'text': 'Blue', 'score': 30},
        {'text': 'Yellow', 'score': 40},
      ]
    },
    {
      'Question': 'What\'s your favourite Animal?',
      'Answer': [
        {'text': 'Lion', 'score': 10},
        {'text': 'Elephant', 'score': 20},
        {'text': 'Bird', 'score': 30},
        {'text': 'Tiger', 'score': 40},
      ]
    },
    {
      'Question': 'What\'s your favourite Book?',
      'Answer': [
        {'text': 'Zero to one', 'score': 10},
        {'text': 'The power of conscious mind', 'score': 20},
        {'text': 'Center of the earth', 'score': 30},
        {'text': 'King of the earth', 'score': 40},
      ]
    },
  ];

  void Answer_Chosen(score) {
    setState(() {
      cash.add(score.toDouble());
      index++;
      total_Score = total_Score+ score.toDouble();
    });
    print(total_Score);
    print("Answer Chosen!");
  }

  void Restart_quiz() {
    setState(() {
      index = 0;
      total_Score=0;
      cash=[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Back_ground_color,
        appBar: AppBar(
          backgroundColor: Back_ground_color==Colors.black?Colors.blueGrey:Back_ground_color,
          elevation: 10,

          title: Text("Quiz App",style: TextStyle(fontSize: 25,color: font_color),),
          actions: <Widget>[
            Switch(
                inactiveThumbColor: font_color,
                inactiveTrackColor: Button_color,
                activeColor: font_color,
                activeTrackColor: Button_color,
                value: Dark_mode, onChanged: (value){
              setState(() {
                Dark_mode=value;
                print(Dark_mode);
                if(Dark_mode==true){
                  font_color=Colors.white;
                  Back_ground_color=Colors.black;
                  Button_color=Colors.grey;
                }else{
                   font_color =Colors.black;
                   Button_color =Colors.blueAccent;
                   Back_ground_color =Colors.white;
                }

              });

            })
          ],
        ),
        body: Container(
          color: Back_ground_color,
          width: double.infinity,
          margin: EdgeInsets.all(10.0),
          child: _question.length > index
              ? Quiz(index, _question, Answer_Chosen)
              : Result(
                  Restart_quiz,total_Score
                ),
        ),
        floatingActionButton:index==0||index>_question.length-1?null: FloatingActionButton(
          child: Icon(Icons.arrow_back,color: font_color,),
          backgroundColor: Button_color,
          onPressed: (){
            setState(() {
              print(cash);
              double sub=cash.last;
              cash.removeLast();
              print('*****');
              print(sub);

              total_Score=total_Score-sub;
              sub=0.0;
              index--;
            });
          },
        ),
      ),
    );
  }
}
