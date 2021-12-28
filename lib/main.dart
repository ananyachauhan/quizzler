import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'quizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main(){
  runApp(MaterialApp(

    home: Quizzeler(),
  ));
}

class Quizzeler extends StatefulWidget {
  @override
  _QuizzelerState createState() => _QuizzelerState();
}
QuizBrain quizBrain= QuizBrain();
List<Icon> icons = [];
class _QuizzelerState extends State<Quizzeler> {



  final sound = AudioCache();
  int serialNo=1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black,

      body:
       Column(
        children: <Widget>[

          Expanded(
            flex: 7,
            child: Center(
              child: Text(
                quizBrain.getQuesText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: (){
                if(quizBrain.getQuesAns() == true){
                  print('correct');
                  sound.play('win.wav');

                  icons.add(
                    Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                  );
                }
                else{
                  print('wrong');
                  sound.play('lose.wav');
                  icons.add(
                      Icon(
                    Icons.clear,
                    color: Colors.red,
                  )
                  );
                }
                setState(() {
                  quizBrain.nextQues();
                  serialNo++;
                });
                if(serialNo==16){
                  return onAlertButtonPressed(context);
                }

                },
              child: Card(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(132, 20, 132, 20),
                    child: Text(
                        'TRUE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                ),
                color: Colors.green,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: FlatButton(
              onPressed: (){
                if(quizBrain.getQuesAns() == false){
                  print('correct');
                  sound.play('win.wav');
                  icons.add(
                      Icon(
                        Icons.check_circle_outline,
                        color: Colors.green,
                      )
                  );
                }
                else{
                  print('wrong');
                  sound.play('lose.wav');
                  icons.add(
                      Icon(
                  Icons.clear,
                  color: Colors.red,
                  )
                  );
                }
                setState(() {
                  quizBrain.nextQues();
                  serialNo++;
                });
                if(serialNo==16){
                  return onAlertButtonPressed(context);

                }
              },
              child: Card(

                child: Padding(
                  padding: EdgeInsets.fromLTRB(130, 20, 130, 20),
                    child: Text(
                        'FALSE',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),)
                ),
                color: Colors.red,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: icons,
          )
        ],
      ),
    );
  }
}

onAlertButtonPressed(context) {
  Alert(
    context: context,
    type: AlertType.success,
    title: "HURRAY!",
    desc: "You have finished the quiz.",
    buttons: [
      DialogButton(
        child: Text(
          "RESTART",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();

  quizBrain.reset();

  icons = [];


}

beginningButtonPressed(context) {
  Alert(
    context: context,
    type: AlertType.info,
    title: "WELCOME!",
    desc: "Check your intelligence via brainteasing questions.",
    buttons: [
      DialogButton(
        child: Text(
          "START",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () => Navigator.pop(context),
        width: 120,
      )
    ],
  ).show();

}
