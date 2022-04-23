import 'package:http/http.dart' as http;
import 'album.dart';
import 'dart:convert';

class AlbumList{
  static Future<List<Album>> fetchAlbum(int page, int limit,) async => http.get(_ApiUrlBuilder.albumList(page, limit),).mapFromResponse<List<Album>, List<dynamic>>((jsonArray) => _parseItemListFromJsonArray(jsonArray, (jsonObject)=> Album.fromJson(jsonObject)));

  static List<T> _parseItemListFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList();
}

class _ApiUrlBuilder {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const _albumsResource = 'albums?';

  static Uri albumList(int page, int limit) => Uri.parse('$_baseUrl$_albumsResource''_page=$page''&_limit=$limit');
}

extension on Future<http.Response> {
  Future<R> mapFromResponse<R, T>(R Function(T) jsonParser) async {

    final response = await this;
    if (response.statusCode == 200) {
      return jsonParser(jsonDecode(response.body));
    } else {
      throw GenericHttpException();
    }
  }
}

class GenericHttpException implements Exception{}