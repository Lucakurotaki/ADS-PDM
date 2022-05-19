import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Text Field Focus',
      home: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  FocusNode mainFocusNode = FocusNode();
  FocusNode firstFocusNode = FocusNode();
  FocusNode secondFocusNode = FocusNode();
  FocusNode thirdFocusNode = FocusNode();

  int nodePos = 0;

  void focusChange(){
    if(nodePos == 0){
      firstFocusNode.requestFocus();
      nodePos++;
    }else if(nodePos == 1){
      secondFocusNode.requestFocus();
      nodePos++;
    }else if(nodePos == 2){
      thirdFocusNode.requestFocus();
    }
  }


  @override
  Widget build(BuildContext context) {
    return RawKeyboardListener(
      autofocus: true,
      focusNode: mainFocusNode,
      onKey: (event){
        if(event is RawKeyDownEvent){
          if(event.isKeyPressed(LogicalKeyboardKey.enter)){
            focusChange();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Enter Focus'),
          backgroundColor: Colors.purple,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                focusNode: firstFocusNode,
              ),
              TextField(
                focusNode: secondFocusNode,
              ),
              TextField(
                focusNode: thirdFocusNode,
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            if(nodePos == 0){
              firstFocusNode.requestFocus();
              nodePos++;
            }else if(nodePos == 1){
              secondFocusNode.requestFocus();
              nodePos++;
            }else if(nodePos == 2){
              thirdFocusNode.requestFocus();
            }

          },
          tooltip: 'Focus Second Text Field',
          child: const Icon(Icons.edit),
        ),
      ),
    );
  }
}