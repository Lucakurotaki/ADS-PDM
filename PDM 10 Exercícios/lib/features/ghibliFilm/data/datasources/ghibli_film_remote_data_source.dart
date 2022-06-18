import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_model.dart';

abstract class GhibliFilmRemoteDataSource {
  Future<GhibliFilmModel> getGhibliFilmById(String id);

  Future<GhibliFilmModel> getRandomGhibliFilm(String id);
}

class GhibliFilmRemoteDataSourceImpl implements GhibliFilmRemoteDataSource{
  final http.Client client;

  GhibliFilmRemoteDataSourceImpl({required this.client});

  @override
  Future<GhibliFilmModel> getGhibliFilmById(String id) =>
    _getFilmFromUrl('https://https://ghibliapi.herokuapp.com/films/$id');

  @override
  Future<GhibliFilmModel> getRandomGhibliFilm(String id) =>
    _getFilmFromUrl('https://https://ghibliapi.herokuapp.com/films/$id');
  

  Future<GhibliFilmModel> _getFilmFromUrl(String urlParam) async {
    var url = Uri.parse(urlParam);

    final response = await client.get(
      url, headers: {'Content-Type' : 'application/json'},
    );

    return response.statusCode == 200 ? GhibliFilmModel.fromJson(jsonDecode(response.body))
      : throw ServerException();
  }
  /**@override
  Future<GhibliFilmModel> getGhibliFilmById(String id) async{
    var url =  Uri.parse('https://https://ghibliapi.herokuapp.com/films/$id');

    final response = await client.get(
      url, headers: {'Content-Type' : 'application/json'},
    );

    return response.statusCode == 200 ? GhibliFilmModel.fromJson(jsonDecode(response.body))
      : throw ServerException();
  }

  @override
  Future<GhibliFilmModel> getRandomGhibliFilm(String id) async{
    var url = Uri.parse('https://https://ghibliapi.herokuapp.com/film/$id');

    final response = await client.get(
      url, headers: {'Content-Type' : 'application/json'},
    );

    return response.statusCode == 200 ? GhibliFilmModel.fromJson(jsonDecode(response.body))
      : throw ServerException();
  }*/
}