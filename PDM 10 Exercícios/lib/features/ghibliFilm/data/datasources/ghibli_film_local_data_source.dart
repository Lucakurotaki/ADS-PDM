import 'dart:convert';

import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class GhibliFilmLocalDataSource{
  Future<GhibliFilmModel> getLastGhibliFilm();

  Future<void> cacheGhibliFilm(GhibliFilmModel filmToCache);
}

const cachedGhibliFilm = "CACHED_GHIBLI_FILM";

class GhibliFilmLocalDataSourceImpl implements GhibliFilmLocalDataSource{
  final SharedPreferences sharedPreferences;

  GhibliFilmLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<GhibliFilmModel> getLastGhibliFilm(){
    final jsonString = sharedPreferences.getString(cachedGhibliFilm);

    return jsonString != null ? Future.value(GhibliFilmModel.fromJson(jsonDecode(jsonString)))
      : throw CacheException();
  }


  @override
  Future<void> cacheGhibliFilm(GhibliFilmModel filmToCache){
    return sharedPreferences.setString(
      cachedGhibliFilm, 
      jsonEncode(filmToCache.toString()));
  }
}