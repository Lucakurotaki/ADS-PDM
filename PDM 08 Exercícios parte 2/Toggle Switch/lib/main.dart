import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const MyHomePage(title: 'Lamp Switch'),
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
  Color lampColor = Colors.black;

  bool value = false;

  void changeLampColor(bool value){
    if(value == true){
      lampColor = Colors.yellow;
    }else{
      lampColor = Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Spacer(),

            Expanded(
              child: Icon(
                Icons.lightbulb, color: lampColor, size: 200,
              ),
            ),

            const Spacer(),
            
            Expanded(
              child: Transform.scale(
                scale: 2,
                child: Switch.adaptive(
                  value: value,
                  onChanged: (value) {
                    setState(() {
                      this.value = value;
                      changeLampColor(value);
                    });
                  }
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
