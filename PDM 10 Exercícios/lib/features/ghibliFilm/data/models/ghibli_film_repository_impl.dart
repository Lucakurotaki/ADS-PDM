import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/platform/networkInfo.dart';
import 'package:number_trivia/features/ghibliFilm/data/datasources/ghibli_film_local_data_source.dart';
import 'package:number_trivia/features/ghibliFilm/data/datasources/ghibli_film_remote_data_source.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibli_film.dart';

import '../../domain/repositories/ghibli_film_repository.dart';


class GhibliFilmRepositoryImpl implements GhibliFilmRepository{
  final GhibliFilmRemoteDataSource remoteDataSource;
  final GhibliFilmLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  GhibliFilmRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo
  }); 

  Completer completer = Completer();


  @override
  Future<Either<Failure, GhibliFilm>> getGhibliFilmById(String id) {
    return completer.future<Either<Failure, GhibliFilm>>;
  }

  @override
  Future<Either<Failure, GhibliFilm>> getRandomGhibliFilm(String id){
    return completer.future<Either<Failure, GhibliFilm>>;
  }
}
