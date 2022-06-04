import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia/features/ghibliFilm/data/models/ghibliFilmModel.dart';
import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibliFilm.dart';

import '../../../../fixtures/fixtureReader.dart';

void main(){
  const tGhibliFilmModel = GhibliFilmModel(fId: 'fId', title: 'title', director: 'director', image: 'image', description: 'description', releaseDate: 1, runningTime: 1);

  test(
    'should be a subclass of GhibliFilm entity',
    () async{
      expect(tGhibliFilmModel, isA<GhibliFilm>());
    },
  );

  group('fromJson', (){
    test(
      'should return a valid model when the JSON number is an integer',
      () async {
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('film.json'));
        
        final result = GhibliFilmModel.fromJson(jsonMap);

        expect(result, tGhibliFilmModel);
      }
    );

    test(
      'should return a valid model when the JSON number is regarded as a double', 
      () async{
        final Map<String, dynamic> jsonMap = jsonDecode(fixture('film_double.json'));

        final result = GhibliFilmModel.fromJson(jsonMap);

        expect(result, tGhibliFilmModel);
      }
    );
  });

  group('toJson', (){
    test(
      'should return a JSON map containing the proper data',
      () async{
        final result = tGhibliFilmModel.toJson();

        final expectedJsonMap = {
          "id": "fId",
          "title" : "title",
          "director" : "director",
          "image" : "image",
          "description" : "description",
          "release_date" : 1,
          "running_time" : 1
        };

        expect(result, expectedJsonMap);
      }
    );
  });
}