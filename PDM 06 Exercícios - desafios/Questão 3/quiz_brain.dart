import 'question.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class QuizBrain {
  int _questionNumber = 0;

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('json/questions.json');
    final Map<String, dynamic> data = await jsonDecode(response);

    for (final question in data['questions']){
      _questionBank.add(Question.fromJson(question));
    }
  }

  final List<Question> _questionBank = [Question('Question', 'true')];

  void nextQuestion(){
    if(_questionNumber < _questionBank.length -1){
      _questionNumber++;
    }
  }

  String getQuestionText() {
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