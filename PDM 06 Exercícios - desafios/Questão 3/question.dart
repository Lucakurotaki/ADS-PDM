class Question {
  late String questionText;
  late String questionAnswer;

  Question(String qst, String ans){
    questionText = qst;
    questionAnswer = ans;
  }

  Question.fromJson(Map<String, dynamic> json)
    : questionText = json['questionText'],
      questionAnswer = json['questionAnswer'];
}