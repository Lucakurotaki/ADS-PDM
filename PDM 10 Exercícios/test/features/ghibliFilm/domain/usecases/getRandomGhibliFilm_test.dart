import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibliFilm.dart';
import 'package:number_trivia/features/ghibliFilm/domain/usecases/getRandomGhibliFilm.dart';
import 'package:mockito/mockito.dart';
import '../repositories/mock/ghibliFilmRepositoryMock.mocks.dart';
import 'package:dartz/dartz.dart';

void main(){
  const tGhibliFilm = GhibliFilm(fId: '1', title: 'title', director: 'diretor', image: 'image', description: 'description', releaseDate: 1, runningTime: 1);
  final mockGhibliFilmRepository = MockGhibliFilmRepository();
  final usecase = GetRandomGhibliFilm(mockGhibliFilmRepository);

  test(
    'should get a random ghibli film from the repository',
    () async{
      when(mockGhibliFilmRepository.getRandomGhibliFilm(any))
          .thenAnswer((_) async => const Right(tGhibliFilm));
      
      final result = await usecase.call(NoParams());

      expect(result, const Right(tGhibliFilm));
      verify(mockGhibliFilmRepository.getRandomGhibliFilm('f1'));
      verifyNoMoreInteractions(mockGhibliFilmRepository);

    }
  );
}