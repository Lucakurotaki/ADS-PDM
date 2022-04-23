import 'album.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/// List item representing a single Character with its photo and name.
class AlbumListItem extends StatelessWidget {
  const AlbumListItem({
    required this.album,
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: const Icon(Icons.queue_music),
    title: Text(album.title),
    subtitle: Text('User ID: ${album.userId}'),
    onTap: (){
      Fluttertoast.showToast(
        msg: "You clicked on ${album.title}!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.purple,
        textColor: Colors.white,
        timeInSecForIosWeb: 3
      );
    }
  );
}