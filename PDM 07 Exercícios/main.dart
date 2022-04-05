import 'package:flutter/material.dart';
import 'album.dart';
import 'albumList.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const AlbumApp());
}

AlbumList albumList = AlbumList();

class AlbumApp extends StatelessWidget {
  const AlbumApp({Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purple[200],
        appBar: AppBar(
          title: const Text("Album App"),
          backgroundColor: Colors.purple[800],
        ),
        body: const AlbumPage(),
      ),
    );
  }
}


class AlbumPage extends StatefulWidget {
  const AlbumPage({Key? key}) : super(key: key);

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> futureAlbum;
  
  @override
  void initState() {
    super.initState();
    futureAlbum = albumList.fetchAlbum();
  }

  @override
  Widget build(BuildContext context){
    return Center(
      child: 
        FutureBuilder<List<Album>>(
          future: futureAlbum,
          builder: (context, json){
            if (json.hasData){
              return ListView.builder(
                itemCount: json.data!.length,
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.queue_music),
                      title: Text('${json.data![index].title}'),
                      subtitle: Text('User ID: ${json.data![index].userId}'),
                      onTap: (){
                        Fluttertoast.showToast(
                          msg: "You clicked on ${json.data![index].title}!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.purple,
                          textColor: Colors.white,
                          timeInSecForIosWeb: 3
                        );
                      }
                    ),
                  );
                },
              );
            } else if(json.hasError){
              return Text("${json.error}");
            }

            return const CircularProgressIndicator();
          },
        )
    );
  }
}
