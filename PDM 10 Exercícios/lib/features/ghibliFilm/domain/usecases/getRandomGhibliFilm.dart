import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'dart:math';
import '../../../../core/error/failure.dart';
import '../entities/ghibliFilm.dart';
import '../repositories/ghibliFilmRepository.dart';

class GetRandomGhibliFilm extends UseCase<GhibliFilm, NoParams> {
  final GhibliFilmRepository repository;

  GetRandomGhibliFilm(this.repository);

  String generateRandomId(){
    List<String> idList = ['f1'];

    final _random = Random();

    final randomId = idList[_random.nextInt(idList.length)];

    return randomId;

  }

  @override
  Future<Either<Failure, GhibliFilm>> call(NoParams params) async {
    return await repository.getRandomGhibliFilm(generateRandomId());
  }
}
