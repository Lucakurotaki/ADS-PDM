import 'album.dart';
import 'package:flutter/material.dart';
import 'photoScreen.dart';

class AlbumListItem extends StatelessWidget {
  const AlbumListItem({
    required this.album,
    Key? key,
  }) : super(key: key);

  final Album album;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: const Icon(Icons.photo),
    title: Text(album.title),
    subtitle: Text('User ID: ${album.userId}'),
    onTap: (){
     Navigator.push(
       context,
       MaterialPageRoute(
         builder: (context) => PhotoScreen(
           args: PhotoScreenArgs(album.title, album.id),
         )
       )
      );
    }
  );
}