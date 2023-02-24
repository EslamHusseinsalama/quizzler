import 'dart:math';
import 'qution.dart';
import 'quizbran.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizeBarin quizbran =QuizeBarin();

void main() {
  runApp(const quizzler());
}
 num (){

}
class quizzler extends StatelessWidget {
  const quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child:quizpage(),
            ),
        ),
      ),
    );
  }
}

class quizpage extends StatefulWidget {
  const quizpage({Key? key}) : super(key: key);

  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {


  List<Widget> scorekeeper =[];
  int x=0;
  void ss(){
    x=scorekeeper.length;
    int y= quizbran.count();
  if( x > y){
    Alert(context: context, title: "END OF QUIZ", desc: "your score$y").show();
    scorekeeper.clear();
    quizbran.rest();

  }
  }


  void checkanswer(bool uesranswer){
    setState(() {
    bool correctanswer= quizbran.getquwstionanswer();
      if(uesranswer==correctanswer){
        scorekeeper.add(Icon(Icons.check, color:Colors.green));

        quizbran.nextq();
        ss();


      }else{
        scorekeeper.add(Icon(Icons.close, color:Colors.red));
        quizbran.nextq();
        ss();

      }


    });

  }










  @override
  Widget build(BuildContext context) {
    return Column(

      children:<Widget> [
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(

                quizbran.getquwstiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        Row(
          children:<Widget> [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: TextButton(
                  style:TextButton.styleFrom(backgroundColor:Colors.green),
                  onPressed:(){
                    checkanswer(true);




                },

                  child: Text(
                    'True',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),

                ),
              ),
            ),



        Expanded(
          flex: 1,

          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style:TextButton.styleFrom(backgroundColor:Colors.red),
              onPressed:(){

                checkanswer(false);

            },

              child: Text(
                'FALS',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),

            ),
          ),
        ),
          ],
        ),
        Row(
          children: scorekeeper,
        ),

      ],
    );
  }
}

