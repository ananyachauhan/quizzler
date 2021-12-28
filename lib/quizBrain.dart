import 'quesans.dart';

class QuizBrain

{
  int _quesNo = 0;

  List<Questions> _questionBank = [


    ];



   void nextQues(){
         if(_quesNo<_questionBank.length-1){
             _quesNo++;
         }
     }

     String getQuesText(){
       return _questionBank[_quesNo].questionText;
   }

   bool getQuesAns(){
    return _questionBank[_quesNo].questionAns;
  }

  bool isFinished(){
    if(_quesNo>_questionBank.length-1){
      return true;
    }
    else
      return false;
  }

  void reset(){
     _quesNo=0;
  }


}