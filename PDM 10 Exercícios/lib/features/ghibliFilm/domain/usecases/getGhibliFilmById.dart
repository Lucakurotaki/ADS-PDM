import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import '../../../../core/error/failure.dart';
import '../entities/ghibliFilm.dart';
import '../repositories/ghibliFilmRepository.dart';

class GetGhibliFilmById extends UseCase<GhibliFilm, Params> {
  final GhibliFilmRepository repository;

  GetGhibliFilmById(this.repository);

  @override
  Future<Either<Failure, GhibliFilm>> call(Params params) async {
    return await repository.getGhibliFilmById(params.id);
  }
}
