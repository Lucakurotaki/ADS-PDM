import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibliFilm.dart';
import 'package:number_trivia/features/ghibliFilm/domain/repositories/ghibliFilmRepository.dart';
import 'package:number_trivia/features/ghibliFilm/domain/usecases/getAllGhibliFilm.dart';


class MockGhibliFilmRepository extends Mock
    implements GhibliFilmRepository {}


void main() {
  GetAllGhibliFilm usecase;
  MockGhibliFilmRepository mockGhibliFilmRepository;

  const tId = '58611129-2dbc-4a81-a72f-77ddfc1b1b49';
  const tGhibliFilm = GhibliFilm(id: '58611129-2dbc-4a81-a72f-77ddfc1b1b49', title: 'My Neigbor Totoro', director: 'Hayao Miyazaki', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/rtGDOeG9LzoerkDGZF9dnVeLppL.jpg', description: 'Two sisters move to the country with their father in order to be closer to their hospitalized mother, and discover the surrounding trees are inhabited by Totoros, magical spirits of the forest. When the youngest runs away from home, the older sister seeks help from the spirits to find her', releaseDate: 1988, runningTime: 86);
  const tGhbliFilmArray = [tGhibliFilm, GhibliFilm(id: '0440483e-ca0e-4120-8c50-4c8cd9b965d6', title: 'Princess Mononoke', director: 'Hayao Miyazaki', image: 'https://image.tmdb.org/t/p/w600_and_h900_bestv2/jHWmNr7m544fJ8eItsfNk8fs2Ed.jpg', description: 'Ashitaka, a prince of the disappearing Ainu tribe, is cursed by a demonized boar god and must journey to the west to find a cure. Along the way, he encounters San, a young human woman fighting to protect the forest, and Lady Eboshi, who is trying to destroy it. Ashitaka must find a way to bring balance to this conflict.', releaseDate: 1997, runningTime: 134)];
  

  test(
    'should get all ghibli films from the repository',
    () async{
      mockGhibliFilmRepository = MockGhibliFilmRepository();
      when(mockGhibliFilmRepository.getAllGhibliFilm())
          .thenAnswer((_) async => const Right(tGhbliFilmArray));
      
      usecase = GetAllGhibliFilm(mockGhibliFilmRepository);
      final result = await usecase.execute();

      expect(result, const Right(tGhbliFilmArray));
      verify(mockGhibliFilmRepository.getAllGhibliFilm());
      verifyNoMoreInteractions(mockGhibliFilmRepository);
    }
  );
}
