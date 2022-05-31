import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/ghibliFilm.dart';
import '../repositories/ghibliFilmRepository.dart';

class GetGhibliFilmById {
  final GhibliFilmRepository repository;

  GetGhibliFilmById(this.repository);

  Future<Either<Failure, GhibliFilm>> execute({
    required String id,
  }) async {
    return await repository.getGhibliFilmById(id);
  }
}
