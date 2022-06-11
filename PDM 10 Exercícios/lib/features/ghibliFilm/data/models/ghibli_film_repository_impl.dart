import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:number_trivia/core/error/failure.dart';
import 'package:number_trivia/core/error/exception.dart';
import 'package:number_trivia/core/platform/net_work_info.dart';
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


  @override
  Future<Either<Failure, GhibliFilm>> getGhibliFilmById(String id) async {
    if (await networkInfo.isConnected){
      try{
        final remoteFilm = await remoteDataSource.getGhibliFilmById(id);
        localDataSource.cacheGhibliFilm(remoteFilm);
        return Right(remoteFilm);
      } on ServerException{
        return Left(ServerFailure());
      }
    }else{
      try{
        final localFilm = await localDataSource.getLastGhibliFilm();
        return Right(localFilm);
      } on CacheException{
        return Left(CacheFailure());
      }

    }
  }

  @override
  Future<Either<Failure, GhibliFilm>> getRandomGhibliFilm(String id) async {
    if(await networkInfo.isConnected){
      try{
        final remoteFilm = await remoteDataSource.getRandomGhibliFilm(id);
        localDataSource.cacheGhibliFilm(remoteFilm);
        return Right(remoteFilm);
      } on ServerException{
        return Left(CacheFailure());
      }
    }else{
      try{
        final localFilm = await localDataSource.getLastGhibliFilm();
        return Right(localFilm);
      } on CacheException{
        return Left(CacheFailure());
      }
    }
  }
}
