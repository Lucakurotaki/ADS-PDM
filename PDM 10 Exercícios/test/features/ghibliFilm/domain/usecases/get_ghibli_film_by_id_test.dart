import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/core/usecases/usecase.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibli_film.dart';
import 'package:number_trivia/features/ghibliFilm/domain/usecases/get_ghibli_film_by_id.dart';
import '../../mock/ghibli_film_repository_mock.mocks.dart';

void main() {

  const tId = 'id';
  const tGhibliFilm = GhibliFilm(fId: '1', title: 'title', director: 'diretor', image: 'image', description: 'description', releaseDate: 1, runningTime: 1);
  final mockGhibliFilmRepository = MockGhibliFilmRepository();
  final usecase = GetGhibliFilmById(mockGhibliFilmRepository);

  test(
    'should get a ghibli film for the title from the repository',
    () async {
      // arrange
      when(mockGhibliFilmRepository.getGhibliFilmById(any))
          .thenAnswer((_) async => const Right(tGhibliFilm));
      // act
      final result = await usecase(Params(id: tId));
      // assert
      expect(result, const Right(tGhibliFilm));
      verify(mockGhibliFilmRepository.getGhibliFilmById(tId));
      verifyNoMoreInteractions(mockGhibliFilmRepository);
    },
  );
}
