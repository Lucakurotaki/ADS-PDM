import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/ghibliFilm.dart';
import '../repositories/ghibliFilmRepository.dart';

class GetAllGhibliFilm {
  final GhibliFilmRepository repository;

  GetAllGhibliFilm(this.repository);

  Future<Either<Failure, List<GhibliFilm>>> execute() async {
    return await repository.getAllGhibliFilm();
  }
}
