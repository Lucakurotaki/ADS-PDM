import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_model.dart';
import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_repository_impl.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibli_film.dart';
import '../../mock/ghibli_film_local_data_source_mock.mocks.dart';
import '../../mock/ghibli_film_remote_data_source_mock.mocks.dart';
import '../../mock/network_info_mock.mocks.dart';

void main(){
  late GhibliFilmRepositoryImpl repository;
  late MockGhibliFilmRemoteDataSource mockRemoteDataSource;
  late MockGhibliFilmLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp((){
    mockRemoteDataSource = MockGhibliFilmRemoteDataSource();
    mockLocalDataSource = MockGhibliFilmLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = GhibliFilmRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo
    );
  });

  group('getGhibliFilmById',  (){
    const tFId = 'fId';
    const tTitle = 'title';
    const tDirec = 'director';
    const tImage = 'image';
    const tDesc = 'description';
    const tDate = 1;
    const tTime = 1;

    const tGhibliFilmModel = GhibliFilmModel(
      fId: tFId,
      title: tTitle,
      director: tDirec,
      image: tImage,
      description: tDesc,
      releaseDate: tDate,
      runningTime: tTime
    );

    const GhibliFilm tGhibliFilm = tGhibliFilmModel;

    test('should check if the device is online',  (){
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      repository.getGhibliFilmById(tFId);

      verify(mockNetworkInfo.isConnected);
    });

    group('device is online',  (){
      setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      test('should return remote data with the call to remote data source is successful',  () async {
        when(mockRemoteDataSource.getGhibliFilmById(any)).thenAnswer((_) async => tGhibliFilmModel);

        final result = repository.getGhibliFilmById(tFId);

        verify(mockRemoteDataSource.getGhibliFilmById(tFId));

        expect(result, equals(const Right(tGhibliFilm)));
      });
    });

    group('device is offline',  (){
      setUp((){
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);
      });
    });

    
  });
}