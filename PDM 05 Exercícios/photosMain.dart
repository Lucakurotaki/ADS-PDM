import 'package:flutter/material.dart';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.purple,
      appBar: AppBar(
        title: Text("Photos"),
        backgroundColor: Colors.purple,
      ),
      body: PhotosPage(),
    ),
  ));
}

class PhotosPage extends StatefulWidget {
  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  int indexNumber = 0;

  var favoriteList = [false, false, false, false, false];

  void nextPhoto() {
    if (indexNumber < 4){
      setState(() {
        indexNumber += 1;
      });
    }else{
      print('Operação inválida.');
    }
  }

  void previousPhoto() {
    if (indexNumber > 0) {
      setState(() {
        indexNumber -= 1;
      });
    } else {
      print('Operação inválida.');
    }
  }

  Color favoriteStateColor(int index){
    if(favoriteList[index] == true){
      return Colors.red;
    }else{
      return Colors.purple;
    }
  }

  void favoritePhoto(int index){
    if (favoriteList[index] == false){
      setState(() {
        favoriteList[index] = true;  
      });
    }else{
      setState(() {
        favoriteList[index] = false;  
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.asset('images/photo$indexNumber.jpg'),
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
                  icon: const Icon(Icons.arrow_back),
                  iconSize: 30,
                  color: Colors.purple,
                  onPressed: (){
                    previousPhoto();
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
                  icon: const Icon(Icons.favorite),
                  iconSize: 30,
                  color: favoriteStateColor(indexNumber),
                  onPressed: (){
                    favoritePhoto(indexNumber);
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
                  icon: const Icon(Icons.arrow_forward),
                  iconSize: 30,
                  color: Colors.purple,
                  onPressed: (){
                    nextPhoto();
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
