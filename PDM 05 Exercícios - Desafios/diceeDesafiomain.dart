import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Dicee"),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;

  void changeDiceFace(){
    int leftNumber = Random().nextInt(8) +1;
    int rightNumber = Random().nextInt(8) + 1;    

    while (rightNumber == leftNumber){
      rightNumber = Random().nextInt(8) +1;
    }

    setState(() {
      leftDiceNumber = leftNumber;
      rightDiceNumber = rightNumber;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              child: Image.asset('images/octaedro$leftDiceNumber.png'),
              onPressed: (){
                changeDiceFace();
              },
            ),
          ),
          Expanded(
            child: TextButton(
              child: Image.asset('images/octaedro$rightDiceNumber.png'),
              onPressed: (){
                changeDiceFace();
              },
            ),
          ),
        ],
      ),
    );
  }
}
