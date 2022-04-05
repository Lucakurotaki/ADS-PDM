import 'package:http/http.dart' as http;
import 'album.dart';
import 'dart:convert';

class AlbumList{
  List<Album> albumList = [];

  Future<List<Album>> fetchAlbum() async{

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/albums')
    );

    if (response.statusCode != 200){
      throw Exception('Failed to load album');
    }

    final List<dynamic> data = jsonDecode(response.body);

    for (var album in data){
      albumList.add(Album.fromJson(album));
    }

    return albumList;
  }
}
