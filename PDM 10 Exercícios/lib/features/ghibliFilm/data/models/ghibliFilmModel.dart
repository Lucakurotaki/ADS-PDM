import 'package:number_trivia/features/ghibliFilm/domain/entities/ghibliFilm.dart';

class GhibliFilmModel extends GhibliFilm{
  const GhibliFilmModel({
    required String fId,
    required String title,
    required String director,
    required String image,
    required String description,
    required int releaseDate,
    required int runningTime,
  }) : super(
    fId: fId,
    title: title,
    director: director,
    image: image,
    description: description,
    releaseDate: releaseDate,
    runningTime: runningTime,
  );

  factory GhibliFilmModel.fromJson(Map<String, dynamic> json){
    return GhibliFilmModel(
      fId: json['id'],
      title: json['title'],
      director: json['director'],
      image: json['image'],
      description: json['description'],
      releaseDate: json['release_date'],
      runningTime: json['running_time']
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': fId,
      'title' : title,
      'director' : director,
      'image' : image,
      'description' : description,
      'release_date' : releaseDate,
      'running_time' : runningTime,
    };
  }
}