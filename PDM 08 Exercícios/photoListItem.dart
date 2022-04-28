import 'photo.dart';
import 'package:flutter/material.dart';

class PhotoListItem extends StatelessWidget {
  const PhotoListItem({
    required this.photo,
    Key? key,
  }) : super(key: key);

  final Photo photo;

  @override
  Widget build(BuildContext context) => ListTile(
    leading: const Icon(Icons.photo),
    title: Text(photo.title),
    subtitle: Text('Photo ID: ${photo.id}')
  );
}