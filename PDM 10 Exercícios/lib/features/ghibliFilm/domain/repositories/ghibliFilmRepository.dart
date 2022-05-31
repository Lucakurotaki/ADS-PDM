import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/ghibliFilm.dart';

abstract class GhibliFilmRepository {
  Future<Either<Failure, GhibliFilm>> getGhibliFilmById(String id);
  Future<Either<Failure, List<GhibliFilm>>> getAllGhibliFilm();
}
