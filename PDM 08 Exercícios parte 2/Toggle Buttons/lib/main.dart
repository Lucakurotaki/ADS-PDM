import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Font Style',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Text Font Sytle'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<bool> isSelected = [false, false, false];

  TextStyle textStyle = const TextStyle();

  void fontStyle(List<bool> isSelected){
    FontWeight fontWeight = FontWeight.normal;
    FontStyle fontStyle = FontStyle.normal;
    TextDecoration textDecoration = TextDecoration.none;

    if(isSelected[0] == true){
      fontWeight = FontWeight.bold;
    }
    if(isSelected[1] == true){
      fontStyle = FontStyle.italic;
    }
    if(isSelected[2] == true){
      textDecoration = TextDecoration.underline;
    }

    TextStyle newTextStyle =  TextStyle(fontWeight: fontWeight, fontStyle: fontStyle, decoration: textDecoration);

    setState(() {
      textStyle = newTextStyle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            TextField(
              style: textStyle,
            ),
            ToggleButtons(
              borderWidth: 2,
              borderColor: Colors.black,
              color: Colors.purple[800],
              hoverColor: Colors.purple[300],
              fillColor: Colors.purple[800],
              selectedBorderColor: Colors.black,
              selectedColor: Colors.white,
              children: const <Widget>[
                Text('B', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('I', style: TextStyle(fontStyle: FontStyle.italic)),
                Text('U', style: TextStyle(decoration: TextDecoration.underline)),
              ],
              onPressed: (int index){
                setState(() {
                  isSelected[index] = !isSelected[index];
                  fontStyle(isSelected);
                });
              },
              isSelected: isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
