
import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_model.dart';

abstract class GhibliFilmRemoteDataSource {
  Future<GhibliFilmModel> getGhibliFilmById(String id);

  Future<GhibliFilmModel> getRandomGhibliFilm(String id);
}