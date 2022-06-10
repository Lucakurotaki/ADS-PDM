import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_model.dart';

abstract class GhibliFilmLocalDataSource{
  Future<GhibliFilmModel> getLastGhibliFilm();

  Future<void> cacheGhibliFilm(GhibliFilmModel filmToCache);
}