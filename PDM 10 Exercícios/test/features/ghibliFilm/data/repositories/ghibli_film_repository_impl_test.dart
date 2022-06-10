import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/ghibliFilm/data/models/ghibli_film_repository_impl.dart';
import '../../mock/ghibli_film_local_data_source_mock.mocks.dart';
import '../../mock/ghibli_film_remote_data_source_mock.mocks.dart';
import '../../mock/network_info_mock.mocks.dart';

void main(){
  GhibliFilmRepositoryImpl repository;
  MockGhibliFilmRemoteDataSource mockRemoteDataSource;
  MockGhibliFilmLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

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
}