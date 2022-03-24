import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Number"),
        backgroundColor: Colors.red,
      ),
      body: NumberPage(),
    ),
  ));
}

class NumberPage extends StatefulWidget {
  @override
  State<NumberPage> createState() => _NumberPageState();
}

class _NumberPageState extends State<NumberPage> {
  int naturalNumber = Random().nextInt(5000);

  void increaseNumber() {
    setState(() {
      naturalNumber += 1;
    });
  }

  void decreaseNumber() {
    if (naturalNumber > 0) {
      setState(() {
        naturalNumber -= 1;
      });
    } else {
      print('Operação inválida.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Text(
              '$naturalNumber',
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.add),
                  color: Colors.red,
                  onPressed: (){
                    increaseNumber();
                  },
                ),
              )),

              Expanded(
                  child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.white,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: const Icon(Icons.remove),
                  color: Colors.red,
                  onPressed: (){
                    decreaseNumber();
                  },
                ),
              )),
              
            ],
          ),
        ],
      ),
    );
  }
}
