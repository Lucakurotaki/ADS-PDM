import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('images/Luca.jpg'),
                  ),
                  Text(
                    'Luca Kurotaki',
                    style: TextStyle(
                        fontFamily: 'Medieval',
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'FLUTTER STUDENT',
                    style: TextStyle(
                        color: Colors.teal.shade100,
                        fontSize: 20,
                        letterSpacing: 2.5,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.whatsapp,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.phone,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.mail,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    ),

                    SizedBox(
                      height: 10,
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.language,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.calendar_month,
                          color: Colors.white,
                          size: 40,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.home,
                          color: Colors.white,
                          size: 40,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      'Análise e Desenvolvimento de Sistemas',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      height: 10,
                    ),

                    Text('Instituto Federal do Piauí',
                        style: TextStyle(
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
