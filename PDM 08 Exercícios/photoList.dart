import 'package:http/http.dart' as http;
import 'photo.dart';
import 'dart:convert';

class PhotoList{
  static Future<List<Photo>> fetchPhoto(int page, int limit, int albumId) async => http.get(_ApiUrlBuilder.photoList(page, limit, albumId)).mapFromResponse<List<Photo>, List<dynamic>>((jsonArray) => _parseItemListFromJsonArray(jsonArray, (jsonObject)=> Photo.fromJson(jsonObject)));

  static List<T> _parseItemListFromJsonArray<T>(
    List<dynamic> jsonArray,
    T Function(dynamic object) mapper,
  ) =>
      jsonArray.map(mapper).toList();
}

class _ApiUrlBuilder {
  static const _baseUrl = 'https://jsonplaceholder.typicode.com/';
  static const _photosResource = 'photos?';

  static Uri photoList(int page, int limit, int albumid) => Uri.parse('$_baseUrl$_photosResource''albumId=$albumid''&_page=$page''&_limit=$limit');
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