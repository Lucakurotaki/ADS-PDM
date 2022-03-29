import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  final List<Question> _questionBank = [
    Question('The atomic number for lithium is 17', 'true'),
    Question('The black box in a plane is black', 'false'),
    Question('Prince Harry is taller than Prince William', 'false'),
    Question('The star sign Aquarius is represented by a tiger', 'true'),
    Question('Marrakesh is the capital of Morocco', 'false'),
    Question('Waterloo has the greatest number of tube platforms in London', 'true'),
    Question('There are two parts of the body that can`t heal themselves', 'false'),
    Question('The Great Wall of China is longer than the distance between London and Beijing', 'true'),
    Question('There are five different blood groups', 'false'),
    Question('Australia is wider than the moon', 'true'),
  ];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length -1){
      _questionNumber++;
    }
  }

  String getQuestionText(){
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer(){
    return _questionBank[_questionNumber].questionAnswer;
  }

  bool isFinished(){
    if(_questionNumber >= _questionBank.length -1){
      return true;
    }else{
      return false;
    }
  }

  void reset(){
    _questionNumber = 0;
  }
}