import 'package:flutter/material.dart';
import 'quiz_brain.dart';

void main() {
  runApp(const Quizzler());
}

QuizBrain quizBrain = QuizBrain();

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: const Text("Quizzler"),
          backgroundColor: Colors.purple[800],
        ),
        body: const Quizpage(),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}): super(key: key);

  @override
  _QuizpageState createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  List<Icon> scoreKeeper = [];
  
  int score = 0;

  double scorePercentage = 0;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await quizBrain.readJson();
     });
  }

  void quizReset(){
    quizBrain.reset();

    scoreKeeper = [];

    score = 0;

    scorePercentage = 0;
  }

  void percentage(int qstNum, int score){
    int divisor = qstNum*3;
    int dividend = score;

    double perc = (dividend/divisor)*100;

    scorePercentage = perc;
  }

  void checkAnswer(String userPickedAnswer){
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState((){
      if(quizBrain.isFinished() == false){
        if(userPickedAnswer == correctAnswer){
          scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
          score += 3;
        }else if(userPickedAnswer == 'maybe'){
          scoreKeeper.add(const Icon(Icons.question_mark, color: Colors.blue,));
          if(correctAnswer == 'true'){
            score++;
          }
        }else{
          scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
        }
        percentage(scoreKeeper.length, score);
        quizBrain.nextQuestion();
      }else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "You've answered correctly $scorePercentage %!",
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 8),
          )
        );
        quizReset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.green,
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: (){
                setState(() {
                  checkAnswer('true');
                });
              },
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text(
                'False',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: (){
                setState(() {
                  checkAnswer('false');
                });
              },
            ),
          ),
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'Maybe',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: (){
                setState(() {
                  checkAnswer('maybe');
                });
              },
            ),
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: scoreKeeper,
            ),
            Text(
              'Percentage: $scorePercentage %.',
              style: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ]
        ),
      ],
    );
  }
}

