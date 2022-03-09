import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text('I am poor'),
        backgroundColor: Colors.green[800],
      ),
      backgroundColor: Colors.lightBlue[200],
      body: const Center(
        child: Image(
          image: AssetImage('images/coal.png'),
        ),
      ),
    ),
  ));
}
