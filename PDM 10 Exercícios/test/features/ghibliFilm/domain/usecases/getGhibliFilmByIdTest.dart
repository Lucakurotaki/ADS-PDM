import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibliFilm.dart';
import 'package:number_trivia/features/ghibliFilm/domain/repositories/ghibliFilmRepository.dart';
import 'package:number_trivia/features/ghibliFilm/domain/usecases/getGhibliFilmById.dart';

class MockGhibliFilmRepository extends Mock
    implements GhibliFilmRepository {}


void main() {
  GetGhibliFilmById usecase;
  MockGhibliFilmRepository mockGhibliFilmRepository;

  const tId = '58611129-2dbc-4a81-a72f-77ddfc1b1b49';
  const tGhibliFilm = GhibliFilm(id: '58611129-2dbc-4a81-a72f-77ddfc1b1b49', title: 'My Neigbor Totoro', director: 'Hayao Miyazaki', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg', description: 'Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her', releaseDate: 1988, runningTime: 86);

  test(
    'should get a ghibli film for the title from the repository',
    () async {
      // arrange
      mockGhibliFilmRepository = MockGhibliFilmRepository();
      when(mockGhibliFilmRepository.getGhibliFilmById('58611129-2dbc-4a81-a72f-77ddfc1b1b49'))
          .thenAnswer((_) async => const Right(tGhibliFilm));
      // act
      usecase = GetGhibliFilmById(mockGhibliFilmRepository);
      final result = await usecase.execute(id: tId);
      // assert
      expect(result, const Right(tGhibliFilm));
      verify(mockGhibliFilmRepository.getGhibliFilmById(tId));
      verifyNoMoreInteractions(mockGhibliFilmRepository);
    },
  );
}
